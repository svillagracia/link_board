class VotesController < ApplicationController
  def create

    if params.key?(:comment_id)
      thing = Comment.find_by_id(params[:comment_id])
      @post = Post.find(params[:post_id])
      return_page = @post
    elsif params.key?(:post_id)
      thing = Post.find_by_id(params[:post_id])
      return_page = :posts
    elsif params.key?(:user_id)
      thing = User.find_by_id(params[:user_id])
      return_page = :users
    else
      return render plain: "invalid input. Stop it!"
    end

    my_vote = thing.votes.find_by_user_id(current_user)

    if my_vote.nil?
      current_user.ratings << thing.votes.create(vote_params)
    else
      if(params[:vote][:value] != my_vote.value)
        my_vote.value=params[:vote][:value]
        my_vote.save
      else
        flash[:danger] = "You already voted on that!"
      end
    end
      redirect_to return_page

  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end