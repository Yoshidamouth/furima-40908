FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postcode {"123-1111"}
    prefecture_id { 2 }
    municipalities {"横浜"} 
    street_address {"横浜1-1-1"}
    building_name {"横ビル"}
    phone_number {"08000000000"}
  end
end
