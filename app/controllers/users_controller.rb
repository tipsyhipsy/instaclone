class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  layout 'logout_user', only:[:new, :create]

  def index
    @users = current_user
    @posts = Post.where(user_id: @user.id).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ログインしました。"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @posts = Post.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to user_path(@user.id)
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_icon, :user_icon_cache, :remove_user_icon)
  end

  def set_user
    @user = User.find(params[:id])
  end


  def ensure_correct_user
    if current_user.id !=  @user.id
      flash[:notice] ="権限がありません。"
      redirect_to posts_path
    end
  end
end
