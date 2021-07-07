require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能の実装' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '保存できるとき' do

      it '全て記入してあれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '保存できないとき' do

      it '郵便番号が必須であること' do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.postal = 123-1234
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal is invalid')
      end
      it '都道府県が必須であること' do
        @order_address.prefecture_id  = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県のidが1だと保存できないこと' do
        @order_address.prefecture_id  = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が必須であること' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @order_address.address1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it '電話番号が必須であること' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank", 'Telephone is invalid')
      end
      it '電話番号は,9桁以内の半角数値では保存できないこと' do
        @order_address.telephone = 111_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号は12桁以上の半角数値では保存できないこと' do
        @order_address.telephone = 111_111_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が半角数字のみでないと登録できないこと（英字混合だと登録できないこと）' do
        @order_address.telephone = 'aaaaa11111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '全角数字だと登録できないこと' do
        @order_address.telephone = '１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'tokenが空では購入できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end