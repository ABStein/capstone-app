class GoogleVisionController < ApplicationController

  def upload_car

  end


  def process_image 
    if params[:image_link].present?
    #   @results = GoogleCloudService.image_to_cars(params[:image_link], 'link')
    # else 
      image_file = File.open(params[:image_file])
      @results = GoogleCloudService.send_image(image_file, 'file')
    end

    if @results.length == 1
      car = @results.first
      redirect_to "/cars/#{car.id}"
    elsif @results.length == 0
      flash[:success] = "Try a different image :o)"
      redirect_to "/car_upload"
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
