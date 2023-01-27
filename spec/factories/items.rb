FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name             { Faker::Name.name }
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    province_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id  { Faker::Number.between(from: 2, to: 3) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user
  end
end
