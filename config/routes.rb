Rails.application.routes.draw do
  
  get 'school_users/home'
  root to: 'admin_users#home'
  
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  resources :admin_users
  
end
