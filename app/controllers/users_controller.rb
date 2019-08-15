class UsersController < ApplicationController

  def show
    @logs = Log.where(user_id: params[:id]).page(params[:page]).per(5)
    @user_nickname = @logs[0].user.nickname
  end

end