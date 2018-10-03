Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #make a root page for home
  root 'homes#index'

  get '/homes', to: 'homes#index'

  resources :drivers
  resources :trips
  resources :passengers

end
