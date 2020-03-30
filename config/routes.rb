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
resources :users, only: [:show, :edit, :update]
resources :engineers, only: [:show, :edit, :update] do 
  resources :valuations, only:[:new, :index, :create]
end

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
