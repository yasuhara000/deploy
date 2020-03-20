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
  resource :valuations, only:[:new, :index, :create]
end

resources :questions, only: [:new,:show,:index,:create, :edit, :update] do
  resources :answers, only: [:new,:show,:create, :edit, :update]
end

get 'home' => "home#about", as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
