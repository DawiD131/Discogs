class JSONClient
    def initialize(root_url)
      @root_url = root_url
    end
  
    def get(path, params = {})
      resp = conn.get path, params
      body = resp.body
      body = resp.body
      json = JSON.parse(body)
      json
    end
  
    def authenticate(auth_type, auth_content)
      @authenticate = [auth_type, auth_content]
    end
  
    private
  
    def conn
      @conn ||= Faraday.new(url: @root_url) do |builder|
        builder.request :url_encoded
        builder.authorization @authenticate.first, @authenticate.last if @authenticate
      end
    end
  end