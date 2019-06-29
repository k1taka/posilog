class LogsController < ApplicationController

  def index
    @logs = Log.all.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    Log.create(log_params)
    redirect_to root_path

  end

  def log_params
    params.require(:log).permit(:title,:good,:chance,:kind,:image)
  end

end