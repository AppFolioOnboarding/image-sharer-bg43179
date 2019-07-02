Rails.application.routes.draw do

  resources :images, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#home'
  root 'images#new'
end
