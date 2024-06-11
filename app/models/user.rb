class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Password is invalid. Include both letters and numbers"}

  VALID_NAME_REGEX = /\A[ぁ-んァ-ンー-龠]+\z/

  VALID_KATAKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/

  validates :nickname, presence: true
  validates :lastname, presence: true, format: { with: VALID_NAME_REGEX, message: "Last name is invalid. Input full-width characters" }
  validates :firstname, presence: true, format: { with: VALID_NAME_REGEX, message: "First name is invalid. Input full-width characters" }
  validates :lastname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "Last name kana is invalid. Input full-width katakana characters" }
  validates :firstname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "First name kana is invalid. Input full-width katakana characters" }
  validates :dateofbirth, presence: true

  # has_many :items
  # has_many :comments
  # has_many :orders
  
end
