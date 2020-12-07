Rails.application.routes.draw do

  namespace :public do
    resources :orders do
      collection do
        get :complete
        get :confirmation
        post :thanks
      end
    end
  end
  namespace :public do
    resources :cart_items do
      collection do
        delete :destroy_all
      end
    end
  end
  namespace :public do
    resources :customers
  end
  namespace :public do
    resources :items
  end
  namespace :public do
    root 'homes#top'
    get 'homes/about'
  end
  namespace :admin do
   resources :orders
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    root 'homes#top'
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end