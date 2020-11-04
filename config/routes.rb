Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  resources :users, only: [:show] do 
    resources :games, only: [:new, :show, :index, :edit, :update, :delete]
  end

  resources :games 
  resources :consoles, only: [:show] 
  

  root to: "games#index"
end
