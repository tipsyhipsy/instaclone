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
    @post = Post.new(post_params)
    if params[:back]
      render 'new'
    else
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    end
  end

  def confirm
    @post = Post.new(post_params)
  end

  def show
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
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :reomve_image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
