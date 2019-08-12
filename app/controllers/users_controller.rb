class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @logs = current_user.logs.page(params[:page]).per(5).order("created_at DESC")
  end

end