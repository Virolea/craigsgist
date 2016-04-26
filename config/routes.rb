Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_for :users

  root to: 'pages#home'

end
