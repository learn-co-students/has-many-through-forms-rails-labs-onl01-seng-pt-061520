class CommentsController < ApplicationController
before_action :get_comment, only: [:show]

  def create
    comment = Comment.create(comment_params)
    #binding.pry
    #redirect_to post_path(params[:post_id])
    redirect_to comment.post
  end

  def show
    binding.pry
    redirect_to post_path(@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username, :email])
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end
end
