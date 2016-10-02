Rails.application.routes.draw do
  devise_for :users

  resources :talkers, only: [:new, :create, :show]

  namespace :admin do
    get :dashboard, to: 'dashboard#index'

    resources :listeners
    resources :schedules
    resources :talkers, only: [] do
      resource :schedule, only: [:new, :create], controller: 'talkers/schedules'
    end
  end

  root to: 'talkers#new'
end
