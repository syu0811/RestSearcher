class ShopsController < ApplicationController
  def show
    gs = Api::GourmetSearch.new
    @hash = gs.get_restaurants_with_id(params[:id])
    @shop = @hash['results']['shop']
  end
end
