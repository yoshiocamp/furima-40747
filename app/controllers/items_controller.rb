class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_item,only:[:edit, :update, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = @item.user
    @detail = @item.detail
  end



  private


  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :delivery_id, :fee_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end
end

def set_item
  @item = Item.find(params[:id])
 end
