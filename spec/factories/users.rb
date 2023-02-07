FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { 'test123' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '陸太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birth_day             { '19300101' }
  end
end
