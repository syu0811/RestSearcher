class ShopsController < ApplicationController
  def show
    gs = Api::GourmetSearch.new
    @hash = gs.get_restaurants_with_id(params[:id])
    @shop = @hash['results']['shop']
    @favorite = Favorite.new
    @find = Favorite.find_by(shop_id: params[:id])
  end

  def create
    @favorite = Favorite.new(get_params)
    if @favorite.save
      redirect_to shop_path(get_params[:shop_id]), notice: '作成に成功'
    else
      redirect_to shop_path(get_params[:shop_id]), notice: '作成に失敗'
    end
  end

  def destroy
    @favorite = Favorite.find_by(shop_id: params[:id])
    if @favorite.destroy!
      redirect_to shop_path(params[:id]), notice: '削除に成功'
    else
      redirect_to shop_path(params[:id]), notice: '削除に失敗'
    end
  end

  def get_params
    params.require(:favorite).permit(:shop_id, :name, :genre, :open, :photo)
  end
end
