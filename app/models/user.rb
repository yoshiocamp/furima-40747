class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  validates_presence_of :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth

        validates :nickname, presence: true
        validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
        validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
        validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
        validates :last_name_kana, presence: true,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
        validates :birth, presence: true
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end