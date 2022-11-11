require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "ユーザー新規登録" do

    context '商品が出品できる時' do
      it "全てが空でなく、指定の文字を使用していれば出品できる" do 
        expect(@item).to be_valid
      end
    end

    # ここから異常パターン
    context '商品が出品できない時' do
      it "product_name が空だと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "descriptionが空だと出品できない" do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが「--」だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "state_idが「--」だと出品できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it "payer_idが「--」だと出品できない" do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer must be other than 1")
      end

      it "prefecture_idが「--」だと出品できない" do
        @item.prefecture_id  = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "day_to_ship_id が「--」だと出品できない" do
        @item.day_to_ship_id = 1 
        @item.valid?
      
        expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
      end

      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは、¥300~¥9,999,999の間のみ保存可能" do
        @item.price = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceは、¥300~¥9,999,999の間のみ保存可能" do
        @item.price = 100000000 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceが半角数値でないと出品できない" do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end

 
  end
end
