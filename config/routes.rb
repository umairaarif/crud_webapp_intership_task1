Rails.application.routes.draw do
  root 'authers#index'

  resources :authers do
  resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
