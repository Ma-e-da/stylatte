class FavoritesController < ApplicationController


  def create
    @scomment = Scomment.find(params[:scomment_id])
    current_user.favorite!(@scomment)
  end

  def destroy
    @scomment = Favorite.find(params[:id]).scomment
    current_user.unfavorite!(@scomment)
  end

  def index
    @user = current_user
    @posts = @user.posts.all
    @favorites = Favorite.where("user_id = ?", @user)
    
  end

end
