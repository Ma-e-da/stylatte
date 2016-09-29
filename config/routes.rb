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

# ユーザーとフォロワー、フォロイング
# following/followersのIDがいるので、memberにする。（/users/:id/following/:id）
# 逆に、IDがいらないときは、collectionにする。collection do...end
# あるユーザーのフォロワー、フォロイングしている人一覧ためget。
    resources :users do
      member do
        get :following, :followers
      end
    end

# ポストとスタイリストコメント（浅いルートですっきりさせるために、IDのいらない３つのみ、shallowで指定しても同じ。）
    resources :posts do
      resources :scomments, only: [:index, :new, :create]
    end

# お気に入り定義(concern)
    concern :favoritable do
      resources :favorites, only: [:new, :create, :index, :destroy]
    end
# 星のレーティング定義(concern)
    concern :ratable do
      resources :ratings, only: [:create, :update, :index, :destroy]
    end

# アカウントアクティベーションとパスワードリセット
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

# リレーションシップのテーブルを作る。
    resources :relationships,      only: [:create, :destroy]

# IDがいる４つ分。
    resources :scomments, concerns: [:favoritable, :ratable], only: [:show, :edit, :update, :destroy]


  # 何も、７つのアクションだけでなくても、自分でアクション名をカスタムできる。
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


  # コントローラを名前空間によってグループ化、ここではAdmin::名前空間で多数の管理用コントローラ群をまとめている。
  #   namespace :admin do
  #     resources :products
  #   end
  #     # こう書くことで、Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)とできる。

end
