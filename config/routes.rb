Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: %i(new edit create) do
    resources :messages, only: %i(index)
  end
end
