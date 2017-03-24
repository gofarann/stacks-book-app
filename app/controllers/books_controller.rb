class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @result_book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create book_params
    unless book.id == nil
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path
    end
  end

  def destroy
    Book.destroy(params[:id])

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
