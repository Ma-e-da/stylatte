class FavoritesController < ApplicationController

  def new
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      redirect_to root_url
    end
  end

  def index
    @scomments = current_user.scomments
    # current_userがお気に入りテーブルに登録したコメント
  end

  def destroy
    @favorite = current_user.favorites.find_by!(params[:favorite_id])
    if @favorite.destroy
      redirect_to root_url
    end
  end

private
  def favorite_params
    params.require(:favorite).permit(:user_id, :scomment_id)
  end
end
