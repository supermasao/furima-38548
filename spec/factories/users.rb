FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'だ' }
    last_name             { 'だ' }
    first_name_kana       { 'ダ' }
    last_name_kana        { 'ダ' }
    birth_day             { '1930-01-01' }
  end
end
