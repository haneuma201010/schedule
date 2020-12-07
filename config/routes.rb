Rails.application.routes.draw do


  # 生徒用
  resources :student_users
  get    '/login',   to: 'student_sessions#new'
  post   '/login',   to: 'student_sessions#create'
  delete '/logout',  to: 'student_sessions#destroy'
  
  
  # get 'school_users/home'
  root to: 'admin_users#home'
  
  # 管理者用ログイン関係
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  # 教室用ログイン関係
  get    '/school_login',   to: 'school_sessions#new'
  post   '/school_login',   to: 'school_sessions#create'
  delete '/school_logout',  to: 'school_sessions#destroy'
  
  resources :admin_users
  resources :school_users
  
end
