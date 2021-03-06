class SessionsController < ApplicationController
  def new
    # Present an empty login form
    @user = User.new
    @is_login = true
  end

  def create

    # Find the user that is trying to log in    
    u = User.where(email: params[:user][:email]).first
    # and if they have the right password
    if u && u.authenticate(params[:user][:password])
      # Store as a cookie in the users' browser the ID of them,
      # indicating that they are logged in
      # browser holds who it is thats logged into this site
      session[:user_id] = u.id.to_s

      redirect_to listings_path
    else
      # Go back to the login page
      redirect_to new_sessions_path
    end
  end

  def destroy
    reset_session
    redirect_to new_sessions_path
  end
end