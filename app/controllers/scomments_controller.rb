class ScommentsController < ApplicationController


  def create
    @post= Post.find(params[:post_id])
    @scomment = @post.scomments.create(scomment_params)
    @scomment.user_id = current_user.id
        if @scomment.save
          flash[:success] = "Comment created!"
          redirect_to (:back)
        else
          @feed_items = []
          render 'static_pages/home'
        end
  end


  private

   def scomment_params
     params.require(:scomment).permit(:user_id, :content)
   end
   def correct_user
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
   end


end
