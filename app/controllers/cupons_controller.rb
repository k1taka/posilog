class CuponsController < ApplicationController

  def new
    @cupon = Cupon.new
    @store = Store.find(current_store.id)
  end

  def create
    @cupon = Cupon.create(cupon_params)
    if @cupon.save
      redirect_to store_path(current_store.id)
    else        
      redirect_to new_store_cupon_path(current_store.id)
    end
  end

  def index
  end

  def edit
    @cupon = Cupon.find(params[:id])
    @store = Store.find(current_store.id)
  end

  def update
    cupon = Cupon.find(params[:id])
    cupon.update(cupon_params)
    redirect_to store_path(current_store.id)
  end

  private 
  def cupon_params
    params.require(:cupon).permit(:reason,:product,:discount,:image,:limit,:witing,:status).merge(store_id: current_store.id)
  end

end