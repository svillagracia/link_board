class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Link Posted!"
      redirect_to posts_path
    else
      flash[:danger] = "Unsuccessful: Make sure the title contains at least 10 characters and that you have a valid url."
      redirect_to posts_path
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.update(params[:id], post_params)
    redirect_to posts_path
  end

  def destroy
    @post = current_user.posts.destroy(params[:id])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:link,:user_id)
  end

end