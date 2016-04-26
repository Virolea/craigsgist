Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'gists#new', as: :authenticated_root
  end

  root to: 'pages#home'

  resources :gists
end
