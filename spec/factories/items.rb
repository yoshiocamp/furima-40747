FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'これはテストです' }
    price { 500 }
    category_id { 2 }
    delivery_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    status_id { 2 }

    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/work-shop.jpg'), filename: 'work-shop.jpg')
    end
  end
end
