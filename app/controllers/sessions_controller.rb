class SessionsController < ApplicationController
  def login_form; end

  def login
    # raise
    author = Author.find_by_name(params[:name])

    if author
      # found successfully
      session[:author_id] = author.id
      flash[:success] = "HELLO #{ author.name }"
      redirect_to root_path
    else
      # did not find
      flash.now[:error] = "Author not found"
      render :login_form
    end
  end

  def logout
    # session[:author_id] = nil
    session.delete(:author_id)
    flash[:success] = "You are successfully logged out"
    redirect_to root_path
  end
end
