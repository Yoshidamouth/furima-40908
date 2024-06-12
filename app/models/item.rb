class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, presence: true,length: { maximum: 40 }
  validates :explain, presence: true,length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :user, presence: true
  validates :category, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :situation, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :delivery_charge, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :prefecture, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :shipping_day, numericality: { other_than: 1 ,message: "can't be blank"} 

  has_many :comments
  belongs_to :user
  has_one :order
  has_one_attached :image

end
