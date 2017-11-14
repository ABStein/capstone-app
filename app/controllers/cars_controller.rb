class CarsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  def index 
    @cars = Car.all
    @home_page = true
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
    @car = Car.find(params[:id])
    @favorite_car = current_user.favorite_car(@car)
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

