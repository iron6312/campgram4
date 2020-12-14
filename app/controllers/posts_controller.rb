class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :description, :recomended, :image).merge(user_id: current_user.id)
  end
end
