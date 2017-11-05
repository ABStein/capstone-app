require "google/cloud/vision"
require 'googleauth'

class Car < ApplicationRecord
  has_many :favorite_cars 
  has_many :bids
  has_many :users


  scopes =  ['https://www.googleapis.com/auth/cloud-platform', 'https://www.googleapis.com/auth/devstorage.read_only']
  authorization = Google::Auth.get_application_default(scopes)

  def test_image
    vision = Google::Cloud::Vision.new
    image = vision.image "path/to/image"

    # landmark = image.landmark
    # landmark.description #=> "Mount Rushmore"
  end
end