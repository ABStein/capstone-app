class FavoriteCarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_cars = current_user.favorite_cars
    #ALSO YOUR UPDATE CAR DOES NOT WORK
    #MAKE SURE TO DO SOMETHING FOR YOUR PAGE HERE SAYING OH NO YOU HAVE NO FAVORITE CARS!

    
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
    redirect_to "/favorite_cars"
    flash[:success] = "Added to your favorites!"
  end

  def destroy
    @favorite_car = FavoriteCar.find(params[:id])

    @favorite_car.destroy
    redirect_to "/favorite_cars"
  end
end
