class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @result_book = Book.find(params[:id])
  end

  def new
  end

  def create
    book = Book.new
    book.title = params[:title]
    book.author = params[:author]
    save_result = book.save
    if save_result
      redirect_to books_path
    end
  end
end
