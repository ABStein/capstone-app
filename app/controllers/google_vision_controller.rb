class GoogleVisionController < ApplicationController

  def upload_car

  end


  def process_image 
    if params[:image_link].present?
      @results = GoogleCloudService.image_to_cars(params[:image_link], 'link')
      p @results
    else 
      p "FILE PARAMS:"
      p params[:image_file]
      image_file = File.open(params[:image_file])
      @results = GoogleCloudService.send_image(image_file, 'file')
    end
  end

  def file_path
    path = File.join Rails.root, 'public', 'system', 'users', user.id.to_s, 'style'

    FileUtils.mkdir_p(path) unless File.exist?(path) 
    File.open(File.join(path, 'img.jpg'), 'wb') do |file|
      file.puts f.read
    end
  end



end
