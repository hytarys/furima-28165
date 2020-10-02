FactoryBot.define do
  factory :order_address do
    token                       { 'Nor7Fr4utx0RwUdCcdynt5xuVbWEfaXbl0tEEzaTnfLkoWl3GSSHEQYBS616MTRoAz3UfGJCdtzBIvaHjOiCTw' }
    postcode                    { '123-4567' }
    prefecture_id               { Faker::Number.between(from: 2, to: 48)}
    city                        {'栄市'}
    house_number                {' 青山1-1-1 '}
    phone_number                { Faker::PhoneNumber.subscriber_number(length: 11)}
  end
end