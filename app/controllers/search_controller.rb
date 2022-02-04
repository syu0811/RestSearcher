class SearchController < ApplicationController
  def index
    gs = Api::GourmetSearch.new
    @genres = gs.get_genres
  end
end
