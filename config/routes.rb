Rails.application.routes.draw do
  get 'page/home'
  devise_for :users
  root "posts#index", as: "home"

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
