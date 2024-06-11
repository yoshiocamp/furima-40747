class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    @item = Item.create(item_params)
    Address.create(address_params)
    redirect_to root_path
  end
  
  private
  
    def item_params
      params.permit(:category_id, :fee_id, :prefecture_id,  :status_id, :image, :price, :name).merge(user_id: current_user.id)
    end

    def address_params
      params.permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number).merge(item_id: @item.id)
    end

end
