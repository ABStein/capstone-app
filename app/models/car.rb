class Car < ApplicationRecord
  has_many :favorite_cars 
  has_many :bids
  has_many :users

  def cheapest_bid
    current_bid = bids[0]
    bids.each do |bid|
      if bid.price < current_bid.price
        current_bid = bid
      end
    end
    current_bid
  end
end