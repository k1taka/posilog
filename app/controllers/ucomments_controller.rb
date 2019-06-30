class UcommentsController < ApplicationController

  def create
    @ucomment = Ucomment.create(ucomment_params)
    redirect_to log_path(params[:log_id])
  end

  private 
  def ucomment_params
    params.require(:ucomment).permit(:text).merge(user_id: current_user.id,log_id:params[:log_id])
  end
end