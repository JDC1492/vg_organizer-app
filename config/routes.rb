Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  resources :users do 
    resources :games, only: [:new, :show, :index, :edit, :update, :delete]
  end

  get '/users/:user_id/consoles/:console_id'

  resources :games 
  resources :consoles, only: [:show] 
  

  root to: "games#index"
end
