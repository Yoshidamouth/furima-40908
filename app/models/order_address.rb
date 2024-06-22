class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipalities
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters."}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"} 

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    address = Address.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end