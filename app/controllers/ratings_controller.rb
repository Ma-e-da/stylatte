class RatingsController < ApplicationController
  def create
    @user_id = current_user.id
    @scomments_id = Scomment.find(params[:id]).id
    @rating = Rating.new(scomment_id: @scomments_id, user_id: @user_id)
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
end
