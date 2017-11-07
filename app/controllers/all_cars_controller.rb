class AllCarsController < ApplicationController
  def display_cars
    @cars = Car.all
  end
end
