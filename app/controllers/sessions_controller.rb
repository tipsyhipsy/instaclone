class SessionsController < ApplicationController
  layout 'logout_user'
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]= "ログインしました。"
      redirect_to posts_path(user.id)
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:noice]= "ログアウトしました。"
    redirect_to new_session_path
  end

end
