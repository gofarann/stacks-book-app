Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create"

  get "/books", to: "books#index"
  get "/books/:id", to: "books#show", as: 'book'
end
