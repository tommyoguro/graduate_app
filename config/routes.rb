Rails.application.routes.draw do
  get "seller_offers/index"
  get "buyer_requests/index"
  get "menu/index"
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

  # 🔹 Deviseのスコープを明示的に設定
  devise_scope :user do
    delete "/users/sign_out", to: "devise/sessions#destroy"
    # Deviseのスコープ外に登録完了ページを追加
  get '/registration_complete', to: 'users/registrations#complete', as: 'registration_complete'
    root to: "devise/sessions#new" # 未ログインユーザーのルート
  end

  # 🔹 ログイン後のメニュー画面
  get '/menu', to: 'menu#index', as: 'menu'  # ← メニュー画面ルート追加

  # 🔹 認証状態に応じたルート設定
  authenticated :user do
    root to: "menu#index", as: :authenticated_root 
  end 

  unauthenticated do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end  

      # ユーザープロフィールページ
  resources :users, only: [:index, :show]
  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'

  # タスク管理ページ
  resources :tasks

  # ダッシュボード
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # manifest.json のルート（エラー回避）
  get '/manifest.json', to: proc { [200, { 'Content-Type' => 'application/json' }, [File.read(Rails.root.join('public/manifest.json'))]] }

  # 🔹 各機能のページ
  get '/buyer_requests', to: 'buyer_requests#index', as: 'buyer_requests'
  get '/seller_offers', to: 'seller_offers#index', as: 'seller_offers'
end
