FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '八王子' }
    address { '青山111' }
    building_name { '東京ハイツ' }
    phone_number { '09010002000' }
    user_id { 1 }
    item_id { 1 }
  end
end
