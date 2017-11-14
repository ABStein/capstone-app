class User < ApplicationRecord
  has_secure_password
  has_many :favorite_cars
  has_many :cars, through: :favorite_cars 

  def favorite_car(car_object)
    favorite_cars.joins(:car).find_by("cars.id = ?", car_object.id)
  end
end
