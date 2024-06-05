class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :status
  
  has_one_attached :image
end
