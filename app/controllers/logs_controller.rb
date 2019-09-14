class LogsController < ApplicationController

  before_action :move_to_index,except: [:index,:show]
  before_action :set_api,only: [:new,:edit]
  IMAGE_COUNT = 4

  def index
    @logs = Log.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @coupons = Coupon.where(status:"open").limit(4).order("created_at DESC")
  end

  def new
    @log = Log.new
    gon.API_KEY = Rails.application.credentials.gcp[:API_KEY]
    IMAGE_COUNT.times{@log.log_images.build}
  end

  def create
    @log=Log.create(log_params)
    @log.user_id = current_user.id
    if @log.save
      redirect_to root_path
    else        
      render 'new' #失敗の場合 
    end
  end

  def destroy
    log = Log.find(params[:id])
    # 未定義のメソッドが出てくるのを防ぐため
    begin
      log.destroy
    rescue NoMethodError
      redirect_to root_path
    end
  end

  def edit
    @log = Log.find(params[:id])
    count = @log.log_images.length
    (IMAGE_COUNT-count).times{@log.log_images.build}
  end

  def update
    @log = Log.find(params[:id])
    @log.update(log_params) 
    if @log.save
      redirect_to root_path
    else        
      render 'new' #失敗の場合 
    end
  end

  def show
    @log = Log.find(params[:id])
    @comments = @log.comments.includes(:user)
    @comment = Comment.new
    @store_comments = @log.store_comments.includes(:store)
    @store_comment = StoreComment.new
  end

  private

  def log_params
    params.require(:log).permit(:title,:good,:chance,:kind,:store_id,:good_score,:chance_score,log_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_api
    gon.API_KEY = Rails.application.credentials.gcp[:API_KEY]
  end

end