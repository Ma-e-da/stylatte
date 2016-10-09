require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path

    # 無効な送信
    assert_no_difference 'Post.count' do
      post posts_path, post: { content: "" }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    content = "This post really ties the room together"
    assert_difference 'Post.count', 1 do
      post posts_path, post: { content: content }
    end

    follow_redirect!
    assert_match content, response.body
  

  end
end
