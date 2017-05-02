Rails.application.routes.draw do
  get 'charges/create'

  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'
  
  
  devise_for :users
  
  # get 'welcome/index'

  # get 'welcome/about'
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  resources :users
  resources :wikis
  resources :charges, only: [:new, :create]
   
end
