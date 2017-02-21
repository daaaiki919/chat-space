Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: %i(index new edit create update) do
    resources :messages, only: %i(index)
  end
end
