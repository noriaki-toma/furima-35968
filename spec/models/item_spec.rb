require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報の入力がうまく行く時' do
      it 'category,condition,image,name,text,shipping_day,postage,prefecture_id,priceが存在していれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryが1では保存できない' do
        @item.category_id = 1
        @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'categoryが空では保存できない' do
        @item.category_id = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが1では保存できない' do
        @item.condition_id = 1
        @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'conditionが空では保存できない' do
        @item.condition_id = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では保存できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'postageが1では保存できない' do
        @item.postage_id = 1
        @item.valid?
      expect(@item.errors.full_messages).to include('Postage Select')
      end
      it 'postageが空では保存できない' do
        @item.postage_id = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'shipping_dayが1では保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day Select')
      end
      it 'shipping_dayが空では保存できない' do
        @item.shipping_day_id = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'prefecture_idが0では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが¥300以下では保存できない' do
        @item.price = 260
        @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥9999999以上では保存できない' do
        @item.price = 100_000_000
        @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end