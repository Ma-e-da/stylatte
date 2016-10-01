class ScommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,  only: :destroy

  def create
    @post= Post.find(params[:post_id])
    @scomment = @post.scomments.create(scomment_params)
    @scomment.user_id = current_user.id
        if @scomment.save
          flash[:success] = "Thank you for a styling! Your Comment has been sent!"
          redirect_to (:back)
        else
          @feed_items = []
          render 'static_pages/home'
        end
  end

  def destroy
    @post= Post.find(params[:post_id])
    @scomment = @post.scomments.find(params[:id])
    @scomment.destroy
  end

  def start
  end

  private

   def scomment_params
     params.require(:scomment).permit(:user_id, :content, :picture)
   end
   def correct_user
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
   end


end
