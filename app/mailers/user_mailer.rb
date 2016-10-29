class UserMailer < ApplicationMailer

# ユーザー（変数）と件名をここで指定
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Welcome to STYLATTE"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
