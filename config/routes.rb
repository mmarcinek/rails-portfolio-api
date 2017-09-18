Rails.application.routes.draw do
  devise_for :admins
  resources :projects do
    resources :apps
  end
end
