FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentences }
    category_id { Faker::Number.within(range: 2..11) }
    item_status_id { Faker::Number.within(range: 2..7) }
    postage_id { Faker::Number.within(range: 2..3) }
    region_id { Faker::Number.within(range: 2..48) }
    shipping_date_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9999999) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
