Rails.application.routes.draw do

  # get 'school_users/home' ビューはあるけど未定義（使えない）
  root to: 'admin_users#home'

  # 管理者関係
  resources :admin_users
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  # 教室関係
  resources :school_users
  get    '/school_login',   to: 'school_sessions#new'
  post   '/school_login',   to: 'school_sessions#create'
  delete '/school_logout',  to: 'school_sessions#destroy'
  
  # 講師関係
  resources :teacher_users
  get    '/teacher_login',   to: 'teacher_sessions#new'
  post   '/teacher_login',   to: 'teacher_sessions#create'
  delete '/teacher_logout',  to: 'teacher_sessions#destroy'
  
  
  # 生徒関係
  resources :student_users
  get    '/login',   to: 'student_sessions#new'
  post   '/login',   to: 'student_sessions#create'
  delete '/logout',  to: 'student_sessions#destroy'
  
  
  
  
end
