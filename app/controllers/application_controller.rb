class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user

  def require_login
    # See if we have a logged-in user (probably using session)
    if !session[:user_id]
      # if not logged-in:
      # Show message about not being logged-in and send to root route
      flash[:warning] = "You must be logged in to view this page"
      redirect_to root_path
    end

    # Let it be if there is someone logged-in
  end

  def current_user
    # MEMOIZE: storing something so you dont have to
    # retrieve it all the time
    @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end
end
