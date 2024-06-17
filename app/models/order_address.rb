class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:user_id, :item_id, :token
  

  
  with_options presence: true do
    validates :postal_code,format: {with: /\A\d{3}-\d{4}\z/}
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: "は半角（数字）で入力してください"}, length: { within: 10..11 , message: "は10桁以上11桁以内で入力してください" }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, building: building, order_id: order.id)
  end
end
