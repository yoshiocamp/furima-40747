require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id,item_id: item.id )
  end


  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'building以外の全ての値が入力されていれば購入できる' do
        expect(@order).to be_valid
      end
    end
  
    context '商品が購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3桁ハイフン4桁の形式ではないと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
          expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが空だと購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order.city = ''
        @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと購入できない' do
        @order.addresses = ''
        @order.valid?
          expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order.phone_number = ''
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字でないと購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone number は半角（数字）で入力してください")
      end 

      it 'phone_numberが9桁以下だと購入できない' do
        @order.phone_number = '123456789'
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone number は10桁以上11桁以内で入力してください")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @order.phone_number = '123456789012'
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone number は10桁以上11桁以内で入力してください")
      end


      it 'phone_numberが数字以外が含まれると購入できない' do
        @order.phone_number = '090-1234-56'
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone number は半角（数字）で入力してください")
      end


      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      
    end
  end  

end
