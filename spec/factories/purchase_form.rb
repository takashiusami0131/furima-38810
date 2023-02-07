FactoryBot.define do
  factory :purchase_form do
    postal_code   { '123-4567' }
    province_id   { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    address_line1 { '1' }
    building      { '1' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
