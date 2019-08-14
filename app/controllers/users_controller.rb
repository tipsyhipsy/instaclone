class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]

  def index
    @users = current_user
    # @posts = Post.where(user_id: @user.id)all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to usre_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_icone, :user_icone_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
