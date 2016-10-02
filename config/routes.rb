Rails.application.routes.draw do
  resources :talkers, only: [:new, :create, :show]
end
