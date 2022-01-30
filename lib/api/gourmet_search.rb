module Api
  class GourmetSearch
    def get_restaurants_hash(_param_url = "")
      # api_key = "e8cc8848cc539438"
      url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438&large_area=Z011"
      xml_to_hash(url)
    end

    def get_restaurants_in_range(range, lat, lng)
      url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438"
      range = "range=#{range}"
      lat = "lat=#{lat}"
      lng = "lng=#{lng}"
      url = url + "&" + range + "&" + lat + "&" + lng
      xml_to_hash(url)
    end

    def xml_to_hash(url)
      require 'net/https'
      require "uri"
      require 'httpclient'

      client = HTTPClient.new
      response = client.get(url)
      Hash.from_xml(response.body)
    end
  end
end
