FactoryBot.define do
  factory :order do
    user { create(:user) }
    appliance_model { "#{FFaker::Product.brand} #{FFaker::Product.model}" }
    imei { FFaker::PhoneNumber.imei }
    anual_price { Random.rand(100.00..999.99) }
    parcels_number { Random.rand(1..24) }
  end
end
