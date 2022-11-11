FactoryBot.define do
  factory :item do
    description {Faker::Lorem.sentence}
    product_name{'aaaaa'}
    category_id {2}
    state_id {2}
    payer_id {2}
    prefecture_id{2}
    day_to_ship_id{2}
    price {10000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user 
  end
end

# ユーザーのファクトリーボットと紐づいている。
# ユーザーは必ず商品を持っているわけではない
# からむ名で書いていく
