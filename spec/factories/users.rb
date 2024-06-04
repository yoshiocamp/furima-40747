FactoryBot.define do
  factory :user do
    nickname { 'テストン' }
    first_name { 'test' }  
    last_name { 'time' }
    first_name_kana { 'テスト' }  
    last_name_kana { 'タイム'}
    email {Faker::Internet.email}
    password { 'password1'}
    password_confirmation { password}
    birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
