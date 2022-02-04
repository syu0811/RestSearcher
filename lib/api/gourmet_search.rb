module Api
  class GourmetSearch
    def get_restaurants_in_range(range, lat, lng, page, params_url)
      url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438&range=#{range}&lat=#{lat}&lng=#{lng}&start=#{(page * 10) - 9}#{params_url}"
      xml_to_hash(url)
    end

    def get_restaurants_with_id(id)
      url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438&id=#{id}"
      xml_to_hash(url)
    end

    def get_genres
      url = "http://webservice.recruit.co.jp/hotpepper/genre/v1/?key=e8cc8848cc539438"
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
