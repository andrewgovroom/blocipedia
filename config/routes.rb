Rails.application.routes.draw do
  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'
  
  
  devise_for :users
  
  # get 'welcome/index'

  # get 'welcome/about'
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  resources :users, :wikis
   
end
