FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '八王子' }
    adress { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09010002000' }
    # order   {}
  end
end
