class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index, :show, :create, :destroy]
  before_action :correct_user,  only: :destroy

def new
  @post = Post.new
end

def index
  @posts = current_user.posts.paginate(:page => params[:page], :per_page => 12)
end

def show
  @post = Post.find(params[:id])
end

def create
  @post = current_user.posts.build(post_params)
  if @post.save
    flash[:success] = "Post created!"
    redirect_to root_url
  else
    @feed_items = []
    render 'static_pages/home'
  end
end

def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
end



private

  def post_params
    params.require(:post).permit(:content, :picture)
  end

  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end
