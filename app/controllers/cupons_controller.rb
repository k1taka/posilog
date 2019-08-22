class CuponsController < ApplicationController

  def new
    @cupon = Cupon.new
    @store = Store.find(current_store.id)
  end

  def create
    @cupon = Cupon.create(cupon_params)
    redirect_to store_path(current_store.id)
  end

  def index
  end

  def edit
  end

  def update
  end

  private 
  def cupon_params
    params.require(:cupon).permit(:reason,:product,:discount).merge(store_id: current_store.id)
  end

end