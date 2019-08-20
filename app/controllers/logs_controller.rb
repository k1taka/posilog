class LogsController < ApplicationController

  before_action :move_to_index,except: [:index,:show]

  def index
    @logs = Log.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @log = Log.new
    gon.API_KEY = Rails.application.credentials.gcp[:API_KEY]
    4.times{@log.log_images.build}
  end

  def create
    @log=Log.create(log_params)
    @log.user_id = current_user.id
    redirect_to root_path
  end

  def destroy
    log = Log.find(params[:id])
    begin
      log.destroy
    rescue NoMethodError
      redirect_to root_path
    end
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
    @comments = @log.comments.includes(:user)
    @comment = Comment.new
  end

  private

  def log_params
    params.require(:log).permit(:title,:good,:chance,:kind,:store_id,log_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end