class StoresController < ApplicationController
  before_action :timepass,only:[:show]

  def index
    @stores = Store.all.order("created_at DESC")
  end

  def search
    @stores = Store.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format| 
      format.json { render 'logs/new', json: @stores}
    end
  end

  def show
    @store = Store.find(params[:id])
    @logs = @store.logs.page(params[:page]).per(5)
    @coupons = Coupon.where(store_id: params[:id]).where(status:"open").limit(4).order("created_at DESC")
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to store_path(params[:id])
  end

  private

  def store_params
    params.require(:store).permit(:name,:kind,:url,:profile,:store_id)
  end

  def timepass
    time = Time.now
    coupons = Coupon.all
    coupons.each do |c|
      if c.created_at + c.limit.minutes < time && c.status =="open"
        c.status = "closed"
        c.save
      end
    end 
  end

end