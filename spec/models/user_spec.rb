require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        
      end

      it 'emailが空では登録できない' do
        
      end

      it '重複したemailが存在する場合は登録できない' do

      end

      it 'emailは@を含まないと登録できない' do

      end

      it 'passwordが空では登録できない' do
        
      end

      it 'passwordが5文字以下では登録できない' do

      end

      it 'passwordが数字を含まないと登録できない' do

      end

      it 'passwordが英字を含まないと登録できない' do

      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end

  end

end
