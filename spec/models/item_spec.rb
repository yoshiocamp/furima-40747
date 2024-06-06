require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
end

describe '商品出品機能' do
  context '商品が出品できるとき' do
    it '全ての値が入力されていれば出品できる' do
      
    end
  end

  context '商品が出品できないとき' do
    it 'nameが空だと出品できない' do
      
    end

    it 'descriptionが空だと出品できない' do
      
    end

    it 'priceが空だと出品できない' do
      
    end

    it 'priceが299以下だと出品できない' do
      
    end

    it 'priceが10000000以上だと出品できない' do
      
    end

    it 'priceが半角数字以外だと出品できない' do
      
    end
    
    it 'category_idが空だと出品できない' do
      
    end

    it 'delivery_idが空だと出品できない' do
      
    end

    it 'fee_idが空だと出品できない' do
      
    end

    it 'prefecture_idが空だと出品できない' do
      
    end

    it 'status_idが空だと出品できない' do
      
    end

    it 'imageが空だと出品できない' do
      
    end

  end
  