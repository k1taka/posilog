class StoreCommentsController < ApplicationController

  def create
    @store_comment = StoreComment.create(store_comment_params)
    redirect_to log_path(params[:log_id])
  end

  private 
  def store_comment_params
    params.require(:store_comment).permit(:text).merge(store_id: current_store.id,log_id:params[:log_id])
  end

end
