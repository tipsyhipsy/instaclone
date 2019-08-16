class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render 'new'
    elsif
      @post.save
      ContactMailer.posted_email(@user).deliver_later
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render 'new' if @post.invalid?
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :remove_image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
