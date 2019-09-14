class StoresController < ApplicationController
  before_action :timepass,only:[:show]
  before_action :payjp

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
    @cupons = Cupon.where(store_id: params[:id]).where(status:"open").limit(4).order("created_at DESC")
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to store_path(params[:id])
  end

  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end 

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:API_KEY]
    Payjp::Charge.create(
      amount: 1205, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

  def create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  def self.create_customer(number, cvc, exp_month, exp_year)
    token = self.create_token(number, cvc, exp_month, exp_year)
    Payjp::Customer.create(card: token)
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

  def payjp
    require 'payjp'
  end

end