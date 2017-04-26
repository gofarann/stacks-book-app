require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end



  it "Can create a user" do

    must_redirect_to root_path
    flash[:success].must_equal "Logged in successfully!"
  end


end
