class Car < ApplicationRecord
  has_many :favorite_cars 
  has_many :bids
  has_many :users

end