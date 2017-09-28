class CarsController < ApplicationController
  def index
    @cars = Car.all
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
end
