class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]
  skip_before_action :require_login, only: [:index]

  def index
    if params[:genre_id]
      # retrieve the books specific to that genre
      @books = Book.includes(:genres).where(genres: { id: params[:genre_id]})
    else
      # normal scenario
      @books = Book.all
    end
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
    params[:book][:genres].each do |genre_id|
      if genre_id != "" && genre_id != nil && Genre.find_by(id: genre_id)
        @book.genres << Genre.find_by(id: genre_id)
      end
    end
    @book.save
    if @book.id != nil
      flash[:success] = "Book added successfully"
      redirect_to books_path
    else
      flash.now[:error] = "Error has occurred"
      puts @book.errors.messages
      render "new"
    end
  end

  def edit; end

  def update
    @book.title = book_params[:title]
    @book.author = Author.find(book_params[:author_id])
    @book.description = book_params[:description]
    @book.isbn = book_params[:isbn]

    params[:book][:genres].each do |genre_id|
      if genre_id != "" && genre_id != nil && Genre.find_by(id: genre_id)
        @book.genres << Genre.find_by(id: genre_id)
      end
    end
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
    params.require(:book).permit(:title, :author_id, :description, :isbn, :genres)
  end

  def find_book
    @book = Book.find_by_id(params[:id])
    # @result_book = @book
  end
end
