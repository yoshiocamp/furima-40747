class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  belongs_to :delivery
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :status

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, message: "は半角（数字）で入力してください"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間で設定してください' }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :image, presence: true
 
  

 

end
