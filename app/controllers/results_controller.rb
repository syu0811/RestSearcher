class ResultsController < ApplicationController
  def index
    range = params[:range]
    lat = params[:lat]
    lng = params[:lng]
    @page = get_page < 1 ? 1 : get_page

    gs = Api::GourmetSearch.new
    @shops = gs.get_restaurants_in_range(range, lat, lng, @page)
    next_hash = gs.get_restaurants_in_range(range, lat, lng, @page + 1)
    @next = next_hash['results'].key?('shop')
  end

  def get_page
    params[:page].try(:[], params[:page]).nil? ? 1 : params[:page].to_i
  end
end
