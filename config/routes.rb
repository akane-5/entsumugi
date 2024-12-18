Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#index'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/terms_of_service', to: 'static_pages#terms_of_service'

  resources :shrines, only: %i[index show] do
    collection do
      get 'search', to: 'shrines#search'
      get 'search_json', to: 'shrines#search_json'
    end
    resource :bookmark, only: %i[create destroy]
  end

  resource :users, only: [:show] do
    collection do
      get 'profile', to: 'users#profile'
      get 'my_posts', to: 'users#my_posts'
      get 'bookmarks', to: 'users#bookmarks'
    end
  end

  resources :posts, only: %i[index new create destroy] do
    collection do
      get 'shrine_search', to: 'posts#shrine_search'
    end
  end
end
