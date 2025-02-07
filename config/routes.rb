Rails.application.routes.draw do
  # 404 & 500 エラーページ
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
 
  # Devise のルート
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

   # ログイン済みのユーザーはメニュー画面へ
  authenticated :user do
    root to: "menu#index", as: :authenticated_root
  end  

  #ログアウト後はログイン画面 (`users/sessions/new.html.erb`) に遷移
  devise_scope :user do
    delete "/users/sign_out", to: "devise/sessions#destroy"
  end

    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
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

 end