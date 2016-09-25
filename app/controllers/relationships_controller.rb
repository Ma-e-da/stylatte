class RelationshipsController < ApplicationController
  before_action :logged_in_user

# 上２行では、
# views/users/_follow.html.erbのボタンを押したら、
# フォロー/フォロー解除ボタンを動かすために、
# フォーム（/views/users/_follow.html.erbと/_unfollow.html.erb） から送信されたパラメータを使って
# followed_idに対応するユーザーを見つけてくる。
# その後、見つけてきたユーザーに対して適切に(/models/user.rbの)follow/unfollowメソッド を使います。

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

# 下３行では、
# リスポンド＿toメソッドで、Ajaxリクエストに応答できるようにする。
# リクエストの種類によって、応答を場合分け（formatのhtmlかjsかどちらかを実行するように）している。
# Ajaxリクエストを受信したら、Railsが自動的にアクションと同じ名前を持つJavaScript用の埋め込みRubyファイル (.js.erb)
# ここでは、create.js.erbを呼び出す。

# ブラウザ側でJavaScriptが無効になっていた場合 (Ajaxリクエストが送れない場合) でもうまく動くように
# config/application.rb設定ファイルで、remoteフォームを埋め込んでいる。

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
