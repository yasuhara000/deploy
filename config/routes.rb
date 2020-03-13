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
resources :users, only: [:show, :edit, :update]
resources :engineers, only: [:show, :edit, :update]
resources :questions, only: [:new,:show,:index,:create, :edit, :update]
resources :answers, only: [:new,:show,:create, :edit, :update]
root to: 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
