module ApplicationHelper

  # タイトル
  def full_title(page_title)
      base_title = "StyLatte"
      if page_title.empty?
        base_title
      else
        "#{page_title} | #{base_title}"
      end
    end

  # 現在のユーザーのstylistカラムにt入っていたら、trueを返す
  def stylist?
    current_user(:stylist, true)
  end

  # 現在のユーザーのpublicカラムにt入っていたら、trueを返す
  def public?
    current_user(:public, true)
  end

  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

end
