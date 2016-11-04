class StaticPagesController < ApplicationController
  def home
   if logged_in?
    @post = current_user.posts.build if logged_in?
    @feed_items = current_user.feed
   else
     @posts = Post.all
   end
  end

  def help
  end

  def about
  end

  def contact
  end

  def styliststart
  end

  def stylistanalysis
    @user = current_user
    @user_id = current_user.id
    @ratings = Rating.where(scomment_user: @user_id)
    @total_rating = @ratings.sum(:star)
    @average_rating = @ratings.average(:star)
    @scomments = Scomment.where(user_id: @user_id)


  end

  def admin
  end

  def policy
  end

  def terms
  end
end
