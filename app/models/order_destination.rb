class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,:user_id, :item_id ,:token,:order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "はハイフン(-)必須"}
    validates :prefecture_id,numericality: { other_than: 1,  message: "を設定して下さい" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "の値が正しくありません。桁は10〜11の間" }
    validates :token, presence: {message: "クレジットカード情報を入力して下さい"}
    

end


  def save
    order = Order.create( user_id: user_id ,item_id: item_id)
    
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end