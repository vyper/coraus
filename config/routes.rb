Rails.application.routes.draw do
  devise_for :users

  resources :talkers, only: [:new, :create, :show]

  namespace :admin do
    resources :listeners
    resources :schedules
  end

  root to: 'talkers#new'
end
