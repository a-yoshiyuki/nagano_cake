Rails.application.routes.draw do
  namespace :public do
    get 'sessions/new'
  end
  namespace :admin do
    get 'sessions/new'
  end
  devise_for :customers
  devise_for :admins


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
