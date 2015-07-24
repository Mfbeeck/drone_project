Rails.application.routes.draw do
  resources :galleries
  root 'galleries#landing'

  


end
