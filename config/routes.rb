Rails.application.routes.draw do
  
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :post_images
  resources :users
  get '/template'=>'users#template'
  root 'root#top'
  get '/about'=>'root#about'
end
