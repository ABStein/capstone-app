class FavoriteCarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_cars = current_user.favorite_cars
    
  end

  def new
  end

  def create
    favorite_car = FavoriteCar.new(
                                   user_id: current_user.id,
                                   car_id: params[:car_id],
                                   year: params[:year], 
                                   make: params[:make],
                                   model: params[:model]
                                  )

    favorite_car.save
  end

  def destroy
    @favorite_car = FavoriteCar.find(params[:id])

    @favorite_car.destroy
    redirect_to "/favorite_cars"
  end
end
