Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"

  resources :books

  get "/auth/github/callback", to: "sessions#create"

  # get "/login", to: "sessions#login_form"
  # post "/login", to: "sessions#login"
  #
  delete "/logout", to: "sessions#logout"
  #, except: [:destroy]


  #, only: [:index, :new, :create]

  # get "/books/buy", to: "books#buy", as: "book_buy"

  #
  # get "/books/new", to: "books#new", as: "new_book"
  # post "/books", to: "books#create"
  #
  # get "/books/:id/edit", to: "books#edit", as: "edit_book"
  # patch "/books/:id", to: "books#update"
  #
  # get "/books", to: "books#index"
  # get "/books/:id", to: "books#show", as: 'book'
  #
  # delete "/books/:id", to: "books#destroy", as: "delete_book"
end
