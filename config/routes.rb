Rails.application.routes.draw do
  devise_for :users
  resources :pins #genera las rutas rest de los pins
  root 'pins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
