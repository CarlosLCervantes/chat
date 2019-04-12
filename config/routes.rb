Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'pages#index'

  resource :sessions, only: [:create], format: 'json'
end
