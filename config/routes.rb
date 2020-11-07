Rails.application.routes.draw do
    devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

    resources :users do
      resources :games
    end

    resources :users do
      resources :consoles
   end

    resources :games 
    resources :consoles, only: [:show] 
  
    get 'users/:user_id/games-complete', to: "games#complete", as: "user_completed"

  root to: "games#index"
end
