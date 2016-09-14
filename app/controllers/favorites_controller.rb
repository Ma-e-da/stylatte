class FavoritesController < ApplicationController
  def create
    @user_id = session[:id]
    @scomment_id = Scomment.find(params[:id]).id
    @favorite = Favorite.new(scomment_id: @scomment_id, user_id: @user_id)
    if @favorite.save
      redirect_to root_url
    end
  end

  def destroy
    @faorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to root_url
    end
  end
end
