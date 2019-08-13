class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  # def index
  #   @user = current_user
  #   @posts = Post.where(user_id: @user.id)all
  # end

  def new
    if params[:back]
    @user = User.new(user_params)
    else
      User.new
    end
  end

  def create
    if user.save
      login @user
      flash[:success] = "Hellow #{@user.name}"
      redirect_to posts_path(@user.id)
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
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_icone, :user_icone_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
