class CarsController < ApplicationController
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
                  style: params[:style]
                  )
    car.save 
    redirect_to "/cars/#{car.id}"
  end

  def show
    @car = Car.find(params[:id])   
  end

  def edit 
    @car = Car.find(params[:id])
    
  end

  def update 
    @car = Car.find(params[:id])
    @car.assign_attributes(
                           year: params[:year],
                           make: params[:make],
                           model: params[:model],
                           style: params[:style]
                           )

    @car.save
    flash[:success] = "Successfully Updated Car"
    redirect_to "/cars/#{@car.id}"  
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    flash[:warning] = "Car Deleted"
    redirect_to "/"
  end
end

