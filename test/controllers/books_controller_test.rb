require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  describe BooksController do
    it "should get index" do
      get books_path
      must_respond_with :success
    end

    it "should show one book" do
      get book_path(books(:venetia).id)
      must_respond_with :success
    end

  end
end
