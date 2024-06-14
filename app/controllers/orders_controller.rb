class OrdersController < ApplicationController

  def index
    if user_signed_in?
       @order = Order.new
       @item = Item.find(params[:item_id])
       @order_address = OrderAddress.new
       if current_user.id == @item.user.id || @item.order.present?
          redirect_to root_path
       end

    else
      redirect_to root_path
    end
  end

  def create 
    @item = Item.find(params[:item_id]) 
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
       @order_address.save
        redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  private
  
    def order_params
      # params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:token, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_2b62ea3386691ad79dc99f77" 
      Payjp::Charge.create(
        amount:  @item.price,
        card: order_params[:token],    
        currency: 'jpy'                
      )
    end
end
