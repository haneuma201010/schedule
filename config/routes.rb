Rails.application.routes.draw do
  
  root to: 'admin_users#home'
  
  resources :admin_users
  
end
