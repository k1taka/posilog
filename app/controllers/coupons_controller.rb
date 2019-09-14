class CouponsController < ApplicationController

  def new
    @coupon = Coupon.new
    @store = Store.find(current_store.id)
  end

  def create
    @coupon = Coupon.create(coupon_params)
    if @coupon.save
      redirect_to store_path(current_store.id)
    else        
      redirect_to new_store_coupon_path(current_store.id)
    end
  end

  def index
  end

  def edit
    @coupon = Coupon.find(params[:id])
    @store = Store.find(current_store.id)
  end

  def update
    coupon = Coupon.find(params[:id])
    coupon.update(coupon_params)
    redirect_to store_path(current_store.id)
  end

  private 
  def coupon_params
    params.require(:coupon).permit(:reason,:product,:discount,:image,:limit,:writing,:status).merge(store_id: current_store.id)
  end

end