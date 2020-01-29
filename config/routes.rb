Rails.application.routes.draw do
  resources :items
  root 'groups#index'
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :messages do
      resources :comments
    end
  end
end
