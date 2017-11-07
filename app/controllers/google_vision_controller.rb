class GoogleVisionController < ApplicationController

  def upload_car

  end
  def process_image 
    if params[:image_link].present?
      @results = GoogleCloudService.send_image(params[:image_link], 'link')
    else 
      p "FILE PARAMS:"
      p params[:image_file]
      image_file = File.open(params[:image_file])
      @results = GoogleCloudService.send_image(image_file, 'file')
    end
  end
end
