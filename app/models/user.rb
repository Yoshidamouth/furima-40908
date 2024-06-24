class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, 
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" },
  length: { minimum: 6 }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龠々]+\z/

  VALID_KATAKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/

  validates :nickname, presence: true
  validates :lastname, presence: true, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters" }
  validates :firstname, presence: true, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters" }
  validates :lastname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :firstname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :dateofbirth, presence: true

  has_many :items
  has_many :comments
  has_many :orders
  
end
