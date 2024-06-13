class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order

  belongs_to :prefecture

  
  # validates :postal_code, presence: true
  # validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" } 
  # validates :city, presence: true
  # validates :addresses, presence: true
  # validates :phone_number, presence: true

end
