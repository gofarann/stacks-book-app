Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"

  resources :books

  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#logout"

  resources :genres do
    resources :books, only: [:index]

    # get '/books', to: 'books#index'
    # two ways to get the same nested route
  end

  # resources :books
end
