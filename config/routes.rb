Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions' 
  }

  devise_scope :user do
    root to: "devise/sessions#new" # ログインページをトップページに
  end

 #devise_for :users
   #root 'tasks#index' #追記
  resources :users, only: [:index, :show] #追加
  resources :tasks
  # root "posts#index"  
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'

 #登録完了画面のルートを追加
  get '/registration_complete', to: 'users/registrations#complete', as: 'registration_complete'



end

