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

  def stylists
  end

  def admin
  end

  def policy
  end

  def terms
  end
end
