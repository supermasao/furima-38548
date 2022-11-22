require 'rails_helper'

RSpec.describe OrderDestination, type: :model do

  before do

    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: @user.id,item_id: @item.id)
  end

  describe '商品購入機能' do

    context '購入が問題なくできる時' do
      it '全てが空でなく、指定の文字を使用していれば購入できる' do
        expect(@order_destination).to be_valid
      end

      it '建物名がなくても購入できる' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
      
    end

    # ここから異常パターン
    context '商品の購入ができない時' do

      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("クレジットカード情報を入力して下さい")
      end

      it 'post_codeが登録できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeが登録できない' do
        @order_destination.post_code = 'aaaaaa'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号はハイフン(-)必須")
      end

      it 'prefecture_idが登録できない' do
        @order_destination.prefecture_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'prefecture_idが「--」だと出品できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を設定して下さい")
      end

      it 'city が登録できない' do
        @order_destination.city  = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが登録できない' do
        @order_destination.address  = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end
    

      it 'phone_numberが9桁以下では登録できない' do
        @order_destination.phone_number = 777
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号の値が正しくありません。桁は10〜11の間")
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_destination.phone_number = 777777777777777
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号の値が正しくありません。桁は10〜11の間")
      end

      it 'phone_numberが空では登録できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが半角数値以外では登録できない' do
        @order_destination.phone_number = 'ああああああああああ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号の値が正しくありません。桁は10〜11の間")
      end
     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐付いていなければ投稿できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Itemを入力してください")
      end

     

    end
  end  

end
