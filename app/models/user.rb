class User < ApplicationRecord
  has_many: favorite_cars
  has_many: cars :through favorite_cars 
end
