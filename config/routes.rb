Rails.application.routes.draw do
  
  devise_for :engineers ,controllers:{
   sessions:      'engineers/sessions',
  passwords:     'engineers/passwords',
  registrations: 'engineers/registrations'
}
  devise_for :users ,controllers:{
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}
root to: "home#about"

resources :users, only: [:show, :edit, :update] do
  resources :notifications, only: :index 
end
delete 'users/:id/notifications' => 'notifications#destroy_all', as: 'destroy_all_user_notifications'

resources :engineers, only: [:show, :edit, :update] do 
  resources :valuations, only:[:new, :index, :create]
end
delete 'engineers/:id/notifications' => 'notifications#destroy_all', as: 'destroy_all_engineer_notifications'
get 'engineer/:id/notifications' => 'notifications#index', as: 'engineer_notifications'
resources :questions, only: [:new,:show,:index,:create, :edit, :update] do
  
  resource :likes, only: [:create, :destroy]
  
end


resources :answers, only: [:new,:show,:create, :edit, :update,:index]
post   '/answers/:id/likes' => 'likes#create',   as: 'like'
delete 'answers/:id/likes' => 'likes#destroy', as: 'unlike'
get 'home' => "home#about", as: 'home'
get 'home/user_log' => "home#user_log", as:'user_log'
get 'home/engineer_log' => "home#engineer_log", as:'engineer_log'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
