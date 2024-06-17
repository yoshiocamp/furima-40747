class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index ]
  before_action :set_item,only:[:index, :create ]

  def index
       gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
       @order_address = OrderAddress.new
       if current_user.id == @item.user.id || @item.order.present?
          redirect_to root_path
       end
  end

  def create  
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
       @order_address.save
        redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end
  
  private

    def set_item
      @item = Item.find(params[:item_id])
    end
  
    def order_params
      # params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:token, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:  @item.price,
        card: order_params[:token],    
        currency: 'jpy'                
      )
    end
end
