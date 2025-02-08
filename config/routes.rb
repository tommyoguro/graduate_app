Rails.application.routes.draw do

  # Devise のルート
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

   #未ログインユーザーのルート（ログインページ）
  devise_scope :user do
   root to: "users/sessions#new", as: :unauthenticated_root
   get "/users/sign_out", to: "devise/sessions#destroy", as: :logout
  end

  #ログイン済みのユーザーのルート（メニュー画面）
  authenticated :user do
   root to: "menu#index", as: :authenticated_root
  end  

   #ログアウト後はログイン画面 (`users/sessions/new.html.erb`) に遷移
  devise_scope :user do
    delete "/users/sign_out", to: "devise/sessions#destroy"
    get "/users/sign_out", to: redirect("/users/sign_in") # 明示的にログインページへリダイレクト
  end
  
   # 各ページのルート
  get '/menu', to: 'menu#index', as: 'menu'
  get '/buyer_requests', to: 'buyer_requests#index', as: 'buyer_requests'
  get '/seller_offers', to: 'seller_offers#index', as: 'seller_offers'
 
  # ユーザープロフィールページ
  resources :users, only: [:index, :show]
  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'
 
  # タスク管理ページ
  resources :tasks
 
  # ダッシュボード
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
 
  # manifest.json のルート（エラー回避）
  get '/manifest.json', to: proc { [200, { 'Content-Type' => 'application/json' }, [File.read(Rails.root.join('public/manifest.json'))]] }
 
   # 見積依頼機能
  resources :buyer_requests, only: [:new, :create, :show] do
   resources :seller_offers, only: [:new, :create]  # buyer_requests にネスト
    member do
      get :confirm
    end
  end
 
  resources :seller_offers, only: [:index, :new, :create]
 
  # 管理者機能
  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end

  resources :seller_offers, only: [:index, :new, :create] # `new` を追加

  # ユーザー登録完了ページ
  devise_scope :user do
    get '/registration_complete', to: 'users/registrations#complete', as: 'registration_complete'
  end

  get '/seller_offers/:id/complete', to: 'seller_offers#complete', as: 'seller_offer_complete'

  # 404 & 500 エラーページ
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
 
  # **キャッチオールルートを追加**
  match "*path", to: "errors#not_found", via: :all

  # ゲストログイン機能
  devise_scope :user do
   post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in', as: :users_guest_sign_in
   post '/users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in', as: :users_admin_guest_sign_in
  end
end 
