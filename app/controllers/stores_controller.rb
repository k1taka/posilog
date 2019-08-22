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
    @logs = Log.where(store_id: params[:id]).page(params[:page]).per(5)
    @store = Store.find(params[:id])
    @cupons = Cupon.where(store_id: params[:id]).where(status:"open").limit(4).order("created_at DESC")
  end

  def edit
    @store = Store.find(params[:id])
  end

  def updatep
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
    cupons = Cupon.all
    cupons.each do |c|
      if c.created_at + c.limit.minutes < time && c.status =="open"
        c.status = "closed"
        c.save
      end
    end 
  end

end