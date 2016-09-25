class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @scomments_id = Scomment.find(params[:id]).id
    @favorite = Favorite.new(scomment_id: @scomments_id, user_id: @user_id)
    if @favorite.save
      redirect_to root_url
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(params[:favorite_id])
    if @favorite.destroy
      redirect_to root_url
    end
  end
end
