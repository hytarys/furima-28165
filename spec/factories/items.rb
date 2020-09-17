FactoryBot.define do
  factory :item do
    name                              { 'ラストオブアス' }
    explanation                       { 'おもろいです' }
    price                             { Faker::Number.number(digit: 10)}
    user_id                           { Faker::Number.number(digit: 5)}
    category_id                       { Faker::Number.between(from: 2, to: 10)}
    status_id                         { Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id                   { Faker::Number.between(from: 2, to: 3)}
    shipping_origin_id                { Faker::Number.between(from: 2, to: 48)}
    shipping_span_id                  { Faker::Number.between(from: 2, to: 4)}
  end
end