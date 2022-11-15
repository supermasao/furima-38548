class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :adress, :building_name, :phone_number,:user, :item

  with_options presence: true do
    validates :user
    validates :item
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :adress
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid." }

end


  def save
    order = Order.create( user: user, item: item)
    # オーダーモデルを通してカッコ内のデータを保存してください。左辺には保存した後のレコードが入る。
    # 青文字はカラム名。白文字は変数で中身は保存する具体的なデータを持っている
    Destination.create(post_code: post_code, prefecture_id: prefecture, city: city, adress: adress, building_name: building_name, phone_number: phone_number, order: order)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    # userのバリデーションは必須。このファイルはモデルファイルではないのでuserが空の場合、弾いてくれない。
    # itemも同様
    # 商品購入ページには基本的に、ユーザーやアイテムが空の状態では到達できないが、このファイルはモデル・もどきなのでバリデーションが必要
  end
end