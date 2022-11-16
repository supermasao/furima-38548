require 'rails_helper'

RSpec.describe OrderDestination, type: :model do

  before do
    @order_d = FactoryBot.build(:order_destination)
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@order_d).to be_valid
    end
   end

end
