Rails.application.routes.draw do

  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/edit'
    resources :items
  end
  namespace :admin do
    root 'homes#top'
  end
  devise_for :admins
  devise_for :customers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end