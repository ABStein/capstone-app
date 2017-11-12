class CarsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  def index 
    @cars = Car.all
  end

  def new

  end

  def create
    car = Car.new(
                  year: params[:year],
                  make: params[:make],
                  model: params[:model],
                  style: params[:style],
                  drive_type: params[:drive_type],
                  transmission_type: params[:transmission_type]
                  )
    car.save 
    redirect_to "/cars/#{car.id}"
  end

  def show
    if current_user
      @car = Car.find(params[:id])
      @is_car_favorited = false
      count = 0
      while @is_car_favorited == false && count < current_user.favorite_cars.length
        current_user.favorite_cars.each do |favorite_car|
          if @car.id == favorite_car.car_id
            @is_car_favorited = true
            @favorite_car_id = favorite_car.id
          end
          count += 1
        end
      end
    else
      redirect_to '/login'
    end

  end

  def edit 
    @car = Car.find(params[:id])
  end

  def update 
    @car = Car.find_by(id: params[:id])
    
    @car.assign_attributes(
                           year: params[:year],
                           make: params[:make],
                           model: params[:model],
                           style: params[:style],
                           engine: params[:engine],
                           drive_type: params[:drive_type],
                           transmission_type: params[:transmission_type]
                           )
    if @car.save
      flash[:success] = "Car successfully updated"
      redirect_to "/cars/#{@car.id}"
    end
    # @car.save
    # redirect_to "/cars/#{@car.id}"  
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    # flash[:warning] = "Car Deleted"
    redirect_to "/"
  end
end

