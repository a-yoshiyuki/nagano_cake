Rails.application.routes.draw do

  namespace :admin do
   resources :orders
  end
  namespace :admin do
    resources :end_users
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    root 'homes#top'
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :admins
  devise_for :customers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end