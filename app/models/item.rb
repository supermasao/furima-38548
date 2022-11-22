class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :day_to_ship
  belongs_to :user
  has_one :order

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を設定して下さい" }
  validates :state_id, numericality: { other_than: 1 , message: "を設定して下さい" }
  validates :payer_id, numericality: { other_than: 1 , message: "を設定して下さい" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "を設定して下さい" }
  validates :day_to_ship_id, numericality: { other_than: 1 , message: "を設定して下さい" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
