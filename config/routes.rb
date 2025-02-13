Rails.application.routes.draw do
  root to: "home#index" #ホームページへのルート設定

  # Devise のルート
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  #未ログインユーザーのルート（ログインページ）
  devise_scope :user do
    # 下3つのルーティングはいらない
    # root to: "users/sessions#new"
    # get "/users/sign_out", to: "devise/sessions#destroy", as: :logout
    # get "/users/sign_out", to: redirect("/users/sign_in") # 明示的にログインページへリダイレクト
    #delete "/users/sign_out", to: "users/sessions#destroy" コメントアウト
    delete 'sign_out', to: 'devise/sessions#destroy'
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post '/users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
    get '/registration_complete', to: 'users/registrations#complete', as: 'registration_complete'
    get '/users/sign_in', to: 'users/sessions#new'
    end
    
    # authenticated :user do
  #   root to: "menu#index", as: :authenticated_root
  # end

   # 各ページのルート
  get '/menu', to: 'menu#index', as: 'menu'
  get '/buyer_requests', to: 'buyer_requests#index', as: 'buyer_requests'
  get '/seller_offers', to: 'seller_offers#index', as: 'seller_offers'
  get 'contacts/thank_you', to: 'contacts#thank_you'

  # ユーザープロフィールページ
  resources :users, only: [:index, :show] do
    member do
      get :profile
    end
  end 
  
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

  get '/seller_offers/:id/complete', to: 'seller_offers#complete', as: 'seller_offer_complete'

  # 404 & 500 エラーページ
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  # 🔹 お問い合わせページのルートを追加
  get "/contact", to: "contacts#new", as: "contact"
  post "/contact", to: "contacts#create"

    # **キャッチオールルートを追加**
  match "*path", to: "errors#not_found", via: :all
end
