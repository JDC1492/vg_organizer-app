Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: [:show] do 
    resources :games, only: [:show, :index]
  end

  resources :games, :consoles 


  root to: "games#index"
end
