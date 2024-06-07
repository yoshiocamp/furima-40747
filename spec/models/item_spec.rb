require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

 describe '商品出品機能' do
  context '商品が出品できるとき' do
    it '全ての値が入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できないとき' do
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと出品できない' do
      @item.description = ''
      @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが299以下だと出品できない' do
      @item.price = '299'
      @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間で設定してください")
    end

    it 'priceが10000000以上だと出品できない' do
      @item.price = '10000000'
      @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間で設定してください")
    end

    it 'priceが半角数字以外だと出品できない' do
      @item.price = '３００'
      @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角（数字）で入力してください")
    end
    
    it 'category_idが空だと出品できない' do
      @item.category_id = '1'
      @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'delivery_idが空だと出品できない' do
      @item.delivery_id = '1'
      @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it 'fee_idが空だと出品できない' do
      @item.fee_id = '1'
      @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
    end

    it 'prefecture_idが空だと出品できない' do
      @item.prefecture_id = '1'
      @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'status_idが空だと出品できない' do
      @item.status_id = '1'
      @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
 end
end
  