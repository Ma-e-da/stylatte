class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                          :following, :followers]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy

  def index
    @users = User.all

    # 検索。
    # ユーザー名と性別の両方を受け取っている場合は両方のscopeを使用。
    # どちらも受け取っていない場合は、当然絞り込みは行わない。
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
    if params[:gender].present?
      @users = @users.get_by_gender params[:gender]
    end
    if params[:country].present?
      @users = @users.get_by_country params[:country]
    end
    if params[:stylist].present?
      @users = @users.get_by_stylist params[:stylist]
    end

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @ratings = Rating.all
    @total_rating = @user.ratings.sum(:star)
    @average_rating = @user.ratings.average(:star)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

# usersのstatsのためのメソッド

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.all
    render 'show_follow'
  end

  def favorite
    @title = 'Favoriteをつけたコメント'
    @user  = User.find(params[:id])
    @scomment = current_user.scomments.build
    @feed_scomments = current_user.favorite_scomments.all
    render 'show_favorite'
  end
  # views/users/show_favorite.html.erbへレンダーしている。


  private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :stylist, :gender, :country)
   end

   # beforeフィルター

   # logged_in_userはapplication_controller.rbへ移動した。

   # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

   # 管理者かどうか確認
     def admin_user
       redirect_to(root_url) unless current_user.admin?
     end
end
