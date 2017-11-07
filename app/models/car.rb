require 'google/cloud/vision'

scopes = ["https://www.googleapis.com/auth/calendar"]
auth = ::Google::Auth.new_application_credentials(scopes)
service = ::Google::Apis::CalendarV3::CalendarService.new
service.authorization = auth
service.authorization.fetch_access_token!

class Car < ApplicationRecord
  has_many :favorite_cars 
  has_many :bids
  has_many :users

  def test_google
    project_id = ENV['GOOGLE_PROJECT_ID']

    vision = Google::Cloud::Vision.new(project: 'rugged-sentry-179712')
  end

end