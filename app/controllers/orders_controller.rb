class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    binding.pry
    @item = Item.create(item_params)
    @address = Address.create(address_params)
    # @item_address = ItemAddress.new(order_params)
    redirect_to root_path
  end
  
  private
  
    def item_params
      params.require(:item).permit(:category_id, :fee_id, :prefecture_id,  :status_id, :image, :price, :name).merge(user_id: current_user.id, token: params[:token]).merge(token: params[:token])
    end

    def address_params
      # params.require(:address).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number).merge(item_id: @item.id)
      params.require(:item_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: params[:item_id])
    end

end
