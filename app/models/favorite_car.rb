class FavoriteCar < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_many :bids, through: :car
end
