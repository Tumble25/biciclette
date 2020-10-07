Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :product_categories do
    resources :products do
      resources :product_photos
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
