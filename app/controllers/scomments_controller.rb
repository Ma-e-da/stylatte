class ScommentsController < ApplicationController
  def create
    @post= Post.find(params[:post_id])
    @scomment = @post.scomments.create(scomment_params)
    redirect_to post_path(@post)
  end

  private
  
   def scomment_params
     params.require(:scomment).permit(:content)
   end
   def correct_user
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
   end


end
