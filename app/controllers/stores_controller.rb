class StoresController < ApplicationController

  def search
    @stores = Store.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format| 
      format.json { render 'logs/new', json: @stores}
    end
  end

  def show
    @logs = Log.where(store_id: params[:id]).page(params[:page]).per(5)
    @store_name = @logs[0].store.name    
  end
end