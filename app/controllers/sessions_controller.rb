class SessionsController < ApplicationController
  layout 'logout_user'
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice]= "login"
      redirect_to posts_path(user.id)
    else
      flash.now[:danger] = "failed"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:noice]= "logout"
    redirect_to new_session_path
  end

end
