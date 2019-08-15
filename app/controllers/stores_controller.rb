class StoresController < ApplicationController

  def search
    @stores = Store.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format| 
      format.json { render 'logs/new', json: @stores}
    end
  end

  def show
    @logs = Log.where(store_id: params[:id]).page(params[:page]).per(5)
    @store = @logs[0].store
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

end