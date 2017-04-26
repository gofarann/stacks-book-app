require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  describe BooksController do

    describe "Logged in user actions" do
      def login
        open_session do |sess|
          sess.get auth_github_callback_path, env: {
            'omniauth.auth' => OmniAuth.config.mock_auth[:github]
          }
        end
      end

      before do
        @session = login
      end

      it "should get index" do
        get books_path
        must_respond_with :success
      end

      it "should show one book" do
        @session.get book_path(books(:venetia).id)
        @session.must_respond_with :success
      end

      it "should show a 404 when book not found" do
        @session.get book_path(1)
        @session.must_respond_with :missing
      end

      it "should show the new book form" do
        @session.get new_book_path
        @session.must_respond_with :success
      end

      it "should redirect to list after adding book" do
        @session.post books_path, params: { book:
            { title: "Testing",
              author_id: authors(:metz).id,
              description: "Whatevs",
              isbn: rand(10..50)
            } }
        @session.must_redirect_to books_path
      end

      it "should affect the model when creating a book" do
        proc {
          @session.post books_path, params: { book:
              { title: "Testing",
                author_id: authors(:metz).id,
                description: "Whatevs",
                isbn: rand(10..50)
              }
        }
        }.must_change 'Book.count', 1
      end

      it "should delete a book and redirect to book list" do
        @session.delete book_path(books(:venetia).id)
        @session.must_redirect_to books_path
      end
    end

    describe "Guest user actions" do
      it "should not allow you to see books details if not logged in" do
        get book_path(books(:POODR).id)
        # if they are not logged in they cannot see the resource and are redirected to login.
        must_redirect_to root_path
        flash[:warning].must_equal "You must be logged in to view this page"
      end
    end
  end
end
