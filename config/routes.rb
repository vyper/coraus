Rails.application.routes.draw do
  devise_for :users

  resources :talkers, only: [:new, :create, :show]

  root to: 'talkers#new'
end
