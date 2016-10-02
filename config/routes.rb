Rails.application.routes.draw do

# 最もベーシックな書き方。get 'products/:id' => 'catalog#view'
  root             'static_pages#home'
    get 'help'    => 'static_pages#help'
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
    get 'stylists' => 'static_pages#styliststart'
    get 'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get 'start'   => 'scomments#start'
    get 'sent' => 'scomments#sent'
    get 'got' => 'scomments#got'



# ユーザーとフォロワー、フォロイング
    # following/followersのIDがいる。member（逆は、collection)。(/users/:id/following/:id）
    # あるユーザーのフォロワー、フォロイングしている人一覧のためgetのみ。
    resources :users do
      member do
        get :following, :followers, :favorite, :rating
      end
    end

# ポストとスタイリストコメント（浅いルートですっきりさせるために、IDのいらない３つのみ、shallowで指定しても同じ。）
    resources :posts, only: [:index, :new, :create]do
      resources :scomments, only: [:new, :create]
    end



# アカウントアクティベーションとパスワードリセット
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

# リレーションシップのテーブルを作る。
    resources :relationships,      only: [:create, :destroy]

# IDがいる分。
    resources :posts, only: [:show, :destroy]
    resources :scomments, only: [:show, :edit, :update, :destroy]

# お気に入り
    resources :favorites
# 星
    resources :ratings, only: [:create, :show]



end
