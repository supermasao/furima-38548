class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,:user_id, :item_id ,:token,:order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,numericality: { other_than: 1}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :token

end


  def save
    order = Order.create( user_id: user_id ,item_id: item_id)
    
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end