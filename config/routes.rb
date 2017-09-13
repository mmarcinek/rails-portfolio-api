Rails.application.routes.draw do
  resources :projects do
    resources :apps
  end
end
