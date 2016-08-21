require 'test_helper'
# ログイン済みかどうかを確かめるテスト
class PostsControllerTest < ActionController::TestCase
#１）正しいリクエストを各アクションに向けて発行してみる
  def setup
    @post = posts(:orange)
  end
#２）ポストの数が変化していないかどうか
  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post :create, post: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end
#３）リダイレクトされるかどうかを確かめる。
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to login_url
  end

#自分以外のユーザーのマイクロポストは削除をしようとすると、適切にリダイレクトされることをテスト
  test "should redirect destroy for wrong post" do
    log_in_as(users(:michael))
    post = posts(:ants)
    assert_no_difference 'Post.count' do
      delete :destroy, id: post
    end
    assert_redirected_to root_url
  end
end
