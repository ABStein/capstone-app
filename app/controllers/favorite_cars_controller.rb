class FavoriteCarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_cars = current_user.favorite_cars
    
  end

  def create
    favorite_car = FavoriteCar.new(
                                    user_id: current_user.id,
                                    car_id: params[:car_id]
                                    )

    favorite_car.save
    p 'NEW FAVORITE CAR CREATED!'
    p favorite_car.car_id
    p 'current user id'
    p current_user.id
  end

  def destroy
    @favorite_car = FavoriteCar.find(params[:id])
    @favorite_car.destroy
    flash[:warning] = "Removed From Favorites"
    redirect_to "/"
  end
end
