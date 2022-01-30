class ResultsController < ApplicationController
  def index
    @range = params[:range]
    @lat = params[:lat]
    @lng = params[:lng]

    gs = Api::GourmetSearch.new
    @hash = gs.get_restaurants_in_range(@range, @lat, @lng)
  end
end
