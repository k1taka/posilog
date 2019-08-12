class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to log_path(params[:log_id])
  end

  private 
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,log_id:params[:log_id])
  end
end