class BooksController < ApplicationController
  def index #aka, action
    # @books = "This is a test"
    @books = [
      { title: "Hidden Figures", author: "Margot Lee Shetterly"},
      { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
      { title: "Kindred", author: "Octavia E. Butler"}
    ]
  end

  def show
    # puts "<" * 40
    # puts params[:id]
    books = [
      { id: 1, title: "Hidden Figures", author: "Margot Lee Shetterly"},
      { id: 2, title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
      { id: 3, title: "Kindred", author: "Octavia E. Butler"}
    ]
    @result_book = nil
    books.each do |book|
      if params[:id].to_i == book[:id]
        @result_book = book
      end
    end
  end
end
