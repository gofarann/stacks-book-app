require 'test_helper'

describe Book do
  let(:book) { books(:POODR) }

  it "Books require a title" do
    book.title = nil
    book.valid?.must_equal false

    book.errors.messages.must_include :title

  end

  it "If a title is given the book is valid" do
    book.title = "The Wizard of Oz"
    book.valid?
    book.errors.messages[:title].must_equal []
  end

  it "You can create a book" do
    book.title = "The Wizard of Oz"
    book.isbn = "1111"

    author = Author.new name: "Kari"
    book.author = author

    book.valid?.must_equal true
  end

it "ISBN must be unique" do
  book = books(:POODR)
  book.save.must_equal true


  book2 = Book.new
  book2.title = "The Baby Goat"
  book2.isbn =  book.isbn
  book2.save.must_equal false
  book2.errors.messages.must_include :isbn, "ISBN Must be unique"

  book2.errors.messages[:isbn].must_equal ["has already been taken"]
  book2.errors.messages[:isbn].must_include "has already been taken"


  Book.where(title: "Practical Object Oriented Programming in Ruby")


end



















end
