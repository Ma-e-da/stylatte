class ScommentsController < ApplicationController

  # コメントへのリクエストには、その「コメント」に関連している「投稿」の情報が必要になります。
　#そのため、最初の行でPost.findで「コメント」に関連する「投稿」を取得しています。
  def create
    @post= Post.find(params[:post_id])
    @scomment = @post.scomments.create(scomment_params)
    redirect_to post_path(@post)
  end
  # アソシエーションを定義したことによって利用可能になったメソッド@post.comments.createは「コメント」を作成し、データベースに保存しています。

  private

   def scomment_params
     params.require(:scomment).permit(:content)
   end
   def correct_user
       @post = current_user.posts.find_by(id: params[:id])
       redirect_to root_url if @post.nil?
   end


end
