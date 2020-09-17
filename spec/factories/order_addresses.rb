FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city {Faker::Address.street_name}
    block {Faker::Address.street_address}
    building {Faker::Address.building_number}
    phone_number { Faker::Number.number(digits: 11) }
    token {Faker::Lorem.characters}
  end
end
