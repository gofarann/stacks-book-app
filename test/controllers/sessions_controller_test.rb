require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  describe "auth_callback" do
    it "can login an existing user" do
      user = users(:kari)
      #getting a fixture

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
      #mock_auth is provided by omniauth when the test helper is set to Omniauth testing

      proc {
        get auth_github_callback_path
        # simulate a suer going to the login link

        must_redirect_to root_path #test redirect

        session[:user_id].must_equal user.id

      }.must_change 'User.count', 0

    end

    it "Can create a new user" do

      #create a user
      user = User.new(name: "Jamie", uid: "999", provider: "github", email: "jamie@adadevelopersacademy.org")
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
      #mock_auth is provided by omniauth when the test helper is set to Omniauth testing
      #
      # must_redirect_to root_path
      # flash[:success].must_equal "Logged in successfully!"

      proc {
        get auth_github_callback_path
        # simulate a suer going to the login link

        must_redirect_to root_path #test redirect

        session[:user_id].must_equal User.last.id

      }.must_change 'User.count', 1


    end

    it "will not allow an invalid login to occur" do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({})

      proc {
        get auth_github_callback_path
        # simulate a suer going to the login link
        must_redirect_to root_path #test redirect

        session[:user_id].must_be_nil
        flash[:error] = "Could not log in."


      }.must_change 'User.count', 0


    end
  end

  describe "logging out" do

    it "can log out" do
      login_user(users(:kari))
      delete logout_path

      session[:user_id].must_be_nil
      
    end
  end

end
