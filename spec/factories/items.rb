FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 40) }
    explain { Faker::Lorem.characters(number: 1000) }
    category_id { 2 }
    situation_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    transient do
      skip_image_attachment { false }
    end

    after(:build) do |item, evaluator|
      unless evaluator.skip_image_attachment
        item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
      end
    end
  end
end
