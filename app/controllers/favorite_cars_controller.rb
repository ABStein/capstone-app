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
                                   car_id: params[:car_id]
                                  )

    favorite_car.save
    redirect_to "/cars/#{params[:car_id]}"
    flash[:success] = "Added to your favorites!"
  end

  def destroy
    favorite_car = FavoriteCar.find(params[:id])
    car = favorite_car.car
    favorite_car.destroy
    flash[:danger] = "Removed from your favorites"
    redirect_to "/cars/#{car.id}"
  end
end
