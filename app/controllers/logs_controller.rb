class LogsController < ApplicationController

  before_action :move_to_index,except: [:index,:show]

  def index
    @logs = Log.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
  end

  def create
    @log=Log.create(log_params)
    redirect_to root_path
    @log.user_id = current_user.id
    if @log.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to root_path
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update(log_params) 
    redirect_to root_path
  end

  def show
    @log = Log.find(params[:id])
    @ucomments = @log.ucomments.includes(:user)
    @ucomment = Ucomment.new
  end

  def log_params
    params.require(:log).permit(:title,:good,:chance,:kind,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end