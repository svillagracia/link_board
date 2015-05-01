class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    current_user.comments << @comment

    if @comment.save
      flash[:success] = "Comment Created!"
      redirect_to @post
    else
      flash[:danger] = "Comment not created!"
      redirect_to @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end