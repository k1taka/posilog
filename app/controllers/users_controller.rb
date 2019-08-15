class UsersController < ApplicationController

  def show
    @logs = Log.where(user_id: params[:id]).page(params[:page]).per(5)
    @user = @logs[0].user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile,:user_id)
  end

end