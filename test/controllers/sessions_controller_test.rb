require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  def login
    open_session do |sess|
      sess.get auth_github_callback_path, env: { # using our app's callback route
        'omniauth.auth' => OmniAuth.config.mock_auth[:github] # using the configuration we added above
      }
    end
  end

  it "Can create a user" do

    user_session = login
    user_session.must_redirect_to root_path
    user_session.flash[:success].must_equal "Logged in successfully!"
  end


end
