Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resource :sessions, only: [:create], format: 'json'
end
