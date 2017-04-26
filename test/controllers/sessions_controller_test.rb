require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  def login
    open_session do |sess|
      sess.get auth_github_callback_path, env: {
        'omniauth.auth' => OmniAuth.config.mock_auth[:github]
      }
    end
  end

  # def login
  #   Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  #   get auth_github_callback_path
  # end

  it "Can Create/Login a user" do
    # note we don't need to first log in before we test logging in
    proc {
      user_session = login
      user_session.must_redirect_to root_path
      user_session.flash[:success].must_equal "Logged in successfully!"
    }.must_change 'User.count', 1

    # must_redirect_to root_path
  end

  it "doesn't create a new user on repeat login" do
    proc {
      login     # first login, we don't need to act on
      second_session = login
      second_session.must_redirect_to root_path
    }.must_change 'User.count', 1   # increases by one because of the first login
  end
end
