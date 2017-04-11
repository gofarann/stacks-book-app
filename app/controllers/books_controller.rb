class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @result_book = Book.find_by_id(params[:id])
    if !@result_book
      render_404
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create book_params

    if @book.id != nil
      redirect_to books_path
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.title = book_params[:title]
    @book.author = Author.find(book_params[:author_id])
    @book.description = book_params[:description]
    @book.isbn = book_params[:isbn]
    binding.pry
    if @book.save
      redirect_to book_path
    else
      render "edit"
    end
  end

  def destroy
    Book.destroy(params[:id])

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :description, :isbn)
  end
end
