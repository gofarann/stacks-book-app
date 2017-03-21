class BooksController < ApplicationController
  def index #aka, action


    @books = Book.all

    # @books = "This is a test"
    # @books = [
    #   { title: "Hidden Figures", author: "Margot Lee Shetterly"},
    #   { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
    #   { title: "Kindred", author: "Octavia E. Butler"}
    # ]
  end

  def show

    @result_book = Book.find(params[:id])

  end
end
