Rails.application.routes.draw do
  resource :sessions, only: [:create], format: 'json'
end
