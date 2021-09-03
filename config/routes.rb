Rails.application.routes.draw do
  root 'posts#index', as: 'home'#отвечает за главную страницу

  get 'contacts' => 'pages#contacts'#указываем view(contacts.html.erb) затем класс и метод обрабатывающий эту view

  resources :posts do 
    resources :comments
  end
  #отслеживание путей show,new,delete,index,update(PUT,PATCH),edit,create,destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
