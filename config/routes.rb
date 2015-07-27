Rails.application.routes.draw do
  resources :galleries do
  	resources :attachments
  end
  root 'galleries#landing'
  
  get 'signup'  => 'users#new' 
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  


end
