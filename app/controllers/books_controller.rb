class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @result_book = Book.find(params[:id])
  end
end
