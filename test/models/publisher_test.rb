require "test_helper"

describe Publisher do
  let(:publisher) { Publisher.new }

  it "Cannot create a publisher without a book" do
    publisher.valid?.must_equal false
  end

  it "Can create a publisher" do
    book = Book.new
    book.title = "POODR"
    book.isbn = "11111"
    book.save
    publisher.book = book
    #publisher.book_id = book.id

    publisher.valid?.must_equal true
  end
end
