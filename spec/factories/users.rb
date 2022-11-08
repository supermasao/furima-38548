FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'だ'}
    last_name             {'だ'}
    first_name_kana       {'ダ'}
    last_name_kana        {'ダ'}
    birth_day             {'1930-01-01'}


  end
end