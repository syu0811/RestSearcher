module Api
  class GourmetSearch
    def get_restaurants_in_range(range, lat, lng, page)
      url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438&range=#{range}&lat=#{lat}&lng=#{lng}&start=#{(page * 10) - 9}"
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
