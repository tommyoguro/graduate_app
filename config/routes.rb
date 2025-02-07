Rails.application.routes.draw do
  get "users/index"
  get "users/show"

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

  # Deviseのスコープ外に登録完了ページを追加
  get '/registration_complete', to: 'users/registrations#complete', as: 'registration_complete'

  #認証状態に応じたルート設定
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
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
end


