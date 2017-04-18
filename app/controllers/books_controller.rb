class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]
  skip_before_action :require_login, only: [:index]

  def index
    @books = Book.all
  end

  def show
    if !@book
      render_404
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create book_params

    if @book.id != nil
      flash[:success] = "Book added successfully"
      redirect_to books_path
    else
      flash.now[:error] = "Error has occurred"
      render "new"
    end
  end

  def edit; end

  def update
    @book.title = book_params[:title]
    @book.author = Author.find(book_params[:author_id])
    @book.description = book_params[:description]
    @book.isbn = book_params[:isbn]

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

  def find_book
    @book = Book.find_by_id(params[:id])
    # @result_book = @book
  end
end
