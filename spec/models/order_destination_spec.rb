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
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが登録できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが登録できない' do
        @order_destination.post_code = 'aaaaaa'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが登録できない' do
        @order_destination.prefecture_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが「--」だと出品できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'city が登録できない' do
        @order_destination.city  = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが登録できない' do
        @order_destination.address  = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
    

      it 'phone_numberが9桁以下では登録できない' do
        @order_destination.phone_number = 777
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_destination.phone_number = 777777777777777
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが空では登録できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値以外では登録できない' do
        @order_destination.phone_number = 'ああああああああああ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end
     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ投稿できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

     

    end
  end  

end
