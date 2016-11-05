class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index, :create, :destroy, :update]
  before_action :correct_user,  only: :destroy

def new
  @post = Post.new
end

def update
end

def index
  @user = current_user
  @posts = @user.posts.all
end

def show
  @post = Post.find(params[:id])
end

def create
  @post = current_user.posts.build(post_params)
  if @post.save
    flash[:green] = "Post created!"
    redirect_to root_url
  else
    @feed_items = []
    render 'static_pages/home'
  end
end

def destroy
    @post.destroy
    flash[:green] = "Post deleted"
    redirect_to request.referrer || root_url
end



private

  def post_params
    params.require(:post).permit(:content, :picture, :product, :for_who, :size, :color,
                                  :style_genre, :scene, :season, :price_range, :deadline )
  end

  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end
