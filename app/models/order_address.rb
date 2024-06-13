class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:user_id, :item_id
  

  # validates :postal_code, presence: true
  # validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" } 
  # validates :city, presence: true
  # validates :addresses, presence: true
  # validates :phone_number, presence: true

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, building: building, order_id: order.id)
  end
end
