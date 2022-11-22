require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品が出品できる時' do
      it '全てが空でなく、指定の文字を使用していれば出品できる' do
        expect(@item).to be_valid
      end
    end

    # ここから異常パターン
    context '商品が出品できない時' do
      it 'image が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'product_name が空だと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'descriptionが空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが「--」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを設定して下さい")
      end

      it 'state_idが「--」だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を設定して下さい")
      end

      it 'payer_idが「--」だと出品できない' do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を設定して下さい")
      end

      it 'prefecture_idが「--」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を設定して下さい")
      end

      it 'day_to_ship_id が「--」だと出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を設定して下さい")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it 'priceは、¥300~¥9,999,999の間のみ保存可能' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'priceは、¥300~¥9,999,999の間のみ保存可能' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'priceが半角数値でないと出品できない' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
