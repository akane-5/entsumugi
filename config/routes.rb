Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#index"

  resources :shrines, only: [:index, :show] do
    collection do
      get 'search', to: 'shrines#search'
      get 'search_json', to: 'shrines#search_json'
    end
  end
end
