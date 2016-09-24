source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
#追加、パスワードの暗号化
gem 'bcrypt', '3.1.7'

# 以下の３つは、Sprocketsがアセット圧縮（アセットパイプライン）の際に使用するgem。
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.5.3'

#画像アップ関係
gem 'carrierwave', '0.10.0'
gem 'mini_magick',  '3.8.0'
gem 'fog', '1.36.0'



# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.3'
# Turbolinks ページ遷移をAjaxに置き換え、JavaScriptやCSSのパースを省略することで高速化するgem。
gem 'turbolinks', '2.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.9'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '3.4.0'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.0.0.beta3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.1.3'
end



group :production do
  gem "mysql2", "0.4.4"
  # This gem enables serving assets in production and setting your logger to standard out,
  gem 'rails_12factor', '0.0.2'
end
