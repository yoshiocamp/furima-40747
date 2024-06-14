FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '架空市' }
    addresses { '架空町1-1-1' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end

  
end
