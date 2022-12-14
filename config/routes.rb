Rails.application.routes.draw do
  resources :documents
  resources :ebooks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root 'documents#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do 
    get 'dashboard' => 'dashboard#index'
    resources :employees
    resources :users
  end

  namespace :employee do 
    get 'dashboard' => 'dashboard#index'
    get 'profile' => 'dashboard#profile'
    get 'edit_profile' => 'dashboard#edit_profile'
    patch 'update_profile' => 'dashboard#update_profile'
    post 'capture_punch_in_swipe' => 'attendances#capture_punch_in_swipe'
    post 'capture_punch_out_swipe' => 'attendances#capture_punch_out_swipe'
  end
end
