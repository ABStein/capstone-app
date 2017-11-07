class GoogleCloudService
  REQUEST_URL = "#{ ENV['HOST_NAME'] }/v1/images:annotate?key=#{ ENV['GOOGLE_APPLICATION_CREDENTIALS'] }"
  HEADERS = { "Content-Type": "application/json" }
  
  def self.send_image(image_path)
    p image_path
    request_params = self.image_params(image_path)
    response = Unirest.post(REQUEST_URL, headers: HEADERS, parameters: request_params).body
    results = label_web_results(response)
  end

  private

  def self.image_params(req_image_path)
    image_request = {
      "requests": [
        {
          "image": {
            "source": {
              "imageUri": req_image_path
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
end