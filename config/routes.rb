Rails.application.routes.draw do
  devise_for :users

  resources :talkers, only: [:new, :create, :show]

  namespace :admin do
    get :dashboard, to: 'dashboard#index'

    resources :listeners

    resources :schedules do
      member do
        resource :finish, only: [:new, :create], controller: 'schedules/finish'
      end
    end

    resources :talkers, only: [] do
      resource :schedule, only: [:new, :create, :show], controller: 'talkers/schedules'
    end
  end

  root to: 'talkers#new'
end
