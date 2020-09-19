FactoryBot.define do
  factory :item do
    name                              { 'ラストオブアス' }
    explanation                       { 'おもろいです' }
    price                             { Faker::Number.between(from: 300, to: 9999999)}
    user_id                           { Faker::Number.number(digits: 5)}
    category_id                       { Faker::Number.between(from: 2, to: 11)}
    status_id                         { Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id                   { Faker::Number.between(from: 2, to: 3)}
    shipping_origin_id                { Faker::Number.between(from: 2, to: 48)}
    shipping_span_id                  { Faker::Number.between(from: 2, to: 4)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end