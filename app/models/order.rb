class クラス名
  include ActiveModel::Model
  attr_accessor :name, :price, :fee_id, :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:user_id
  
  # validates :name, presence: true
  # validates :price, presence: true, numericality: { only_integer: true, message: "は半角（数字）で入力してください"}
  # validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間で設定してください' }
  # validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  # validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
  # validates :fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  # validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  # validates :image, presence: true
  # validates :postal_code, presence: true
  # validates :prefecture_id,numericality: { other_than: 1, message: "can't be blank" } 
  # validates :city, presence: true
  # validates :addresses, presence: true
  # validates :phone_number, presence: true
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :delivery_id
    validates :fee_id
    validates :prefecture_id
    validates :status_id
  end
  with_options presence: true do
    validates :name
    validates :image
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :price, numericality: { only_integer: true, message: "は半角（数字）で入力してください"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間で設定してください' }
  end
  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
