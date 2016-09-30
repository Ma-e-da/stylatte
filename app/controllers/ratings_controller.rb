class RatingsController < ApplicationController
  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      flash[:success] = "Star sent!"
      redirect_to root_url
    end
  end

  def show
    @rating = current_user.ratings.find_by!(params[:rating_id])
  end

  private

  def rating_params
    params.require(:rating).permit(:star, :scomment_user, :scomment_id)
  end
end
