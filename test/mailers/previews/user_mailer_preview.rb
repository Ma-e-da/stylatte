# メールのプレビュー

# プレビューの目次ページ；Preview all emails at http://localhost:3000/rails/mailers/user_mailer
# 私の場合、Docker使っているので、http://192.168.99.100:3000/rails/mailers/user_mailerでみれる。

class UserMailerPreview < ActionMailer::Preview


  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  # 私の場合、Dockerなので、http://192.168.99.100:3000/rails/mailers/user_mailer/account_activationでみれる。
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  # 私の場合、Docker使っているので、http://192.168.99.100:3000/rails/mailers/user_mailer/password_resetでみれる。
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
