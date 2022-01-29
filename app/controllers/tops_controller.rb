class TopsController < ApplicationController
  
  def index
    gs = Api::GourmetSearch.new
    @hash = gs.get_restaurants_hash
  end
end
