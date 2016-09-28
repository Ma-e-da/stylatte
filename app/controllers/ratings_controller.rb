class RatingsController < ApplicationController
  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      redirect_to root_url
    end
  end

  def destroy
    @rating = current_user.ratings.find_by!(params[:rating_id])
    if @rating.destroy
      redirect_to root_url
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:star, :scomment_user, :user_id, :scomment_id)
  end
end
