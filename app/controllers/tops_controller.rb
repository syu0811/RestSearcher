class TopsController < ApplicationController
  
  def index
    gs = Api::GourmetSearch.new
    @hash = gs.get_restaurants_hash

    
    # client = HTTPClient.new                 # インスタンスを生成
    # response = client.get(url)              # Getリクエスト
    # @shops = REXML::Document.new(response.body)
    # @datas = Hash.from_xml(response.body) 

  end

  
end
