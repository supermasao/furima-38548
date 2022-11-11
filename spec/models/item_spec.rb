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

      it "category_idが空だと出品できない" do
        @item.category_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "state_idが空だと出品できない" do
        @item.state_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end

      it "payer_idが空だと出品できない" do
        @item.payer_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer is not a number")
      end

      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id  = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "day_to_ship_id が空だと出品できない" do
        @item.day_to_ship_id = '' 
        @item.valid?
      
        expect(@item.errors.full_messages).to include("Day to ship is not a number")
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

    end

 
  end
end
