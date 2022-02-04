class ResultsController < ApplicationController
  def index
    @page = get_page < 1 ? 1 : get_page

    genre = params[:genre].try(:[], params[:genre]).nil? ? nil : params[:genre]

    params_url = ""

    if !genre.nil? || get_smoking || get_parking
      params_url = "&non_smoking=#{get_smoking}&parking=#{get_parking}"
      params_url = "#{params_url}&genre=#{genre}" unless genre.nil?
    end

    gs = Api::GourmetSearch.new
    @shops = gs.get_restaurants_in_range(params[:range], params[:lat], params[:lng], @page, params_url)
    next_hash = gs.get_restaurants_in_range(params[:range], params[:lat], params[:lng], @page + 1, params_url)
    @next = next_hash['results'].key?('shop')
  end

  def get_page
    params[:page].try(:[], params[:page]).nil? ? 1 : params[:page].to_i
  end

  def get_smoking
    params[:smoking].try(:[], params[:smoking]).nil? ? 0 : params[:smoking].to_i
  end

  def get_parking
    params[:parking].try(:[], params[:parking]).nil? ? 0 : params[:parking].to_i
  end
end
