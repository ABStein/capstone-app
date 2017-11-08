class GoogleCloudService
  REQUEST_URL = "#{ ENV['HOST_NAME'] }/v1/images:annotate?key=#{ ENV['GOOGLE_APPLICATION_CREDENTIALS'] }"
  HEADERS = { "Content-Type": "application/json" }
  
  def self.send_image(image_path, image_type)
    if image_type == 'link'
      request_params = self.image_params(image_path)
    elsif image_type == 'file'
      request_params = self.file_params(image_path)
    end

    response = Unirest.post(REQUEST_URL, headers: HEADERS, parameters: request_params).body
    results = label_web_results(response)
  end

  private

  def self.file_params(req_file)
    image_request = {
      "requests": [
        {
          "image": {
            "content": req_file
          },
          "features": [
            {
              "type": "LABEL_DETECTION",
              "maxResults": 50
            },
            {
              "type": "WEB_DETECTION",
              "maxResults": 50
            }
          ]
        }
      ]
    }

    image_request.to_json
  end

  def self.image_params(req_image)
    image_request = {
      "requests": [
        {
          "image": {
            "source": {
              "imageUri": req_image
            }
          },
          "features": [
            {
              "type": "LABEL_DETECTION",
              "maxResults": 50
            },
            {
              "type": "WEB_DETECTION",
              "maxResults": 50
            }
          ]
        }
      ]
    }

    image_request.to_json
  end

  def self.label_results(response)
    return [] unless response["responses"][0]["labelAnnotations"]
    response["responses"][0]["labelAnnotations"].map { |pic| pic["description"] }
  end

  def self.web_results(response)
    return [] unless response["responses"][0]["webDetection"]["webEntities"]
    response["responses"][0]["webDetection"]["webEntities"].map { |pic| pic["description"] }
  end

  def self.label_web_results(response)
    result = label_results(response) + web_results(response)
    result.uniq
  end

  def self.image_to_cars(image_path, image_type)
    potential_car_names = send_image(image_path, image_type).compact
    db_makes = Car.pluck(:make)
    # start with: you have an array of car makes that ARE in the db
    # end with: a list of car objects from the db

    # 1 map split flatten uniq
    # 2
    # 3

    split_car_names = potential_car_names.map { |potential_car_name| potential_car_name.split }
    official_car_names = split_car_names.flatten
    api_data_keywords = official_car_names.uniq
    found_db_makes = api_data_keywords & db_makes # this returns an array of strings that are makes in the db
    car_query = found_db_makes.map { |found_db_make| Car.where(make: found_db_make ) }
  end
end