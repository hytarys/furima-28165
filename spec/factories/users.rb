FactoryBot.define do
  factory :user do
    nickname                    { Faker::Name.initials(number: 2) }
    email                       { Faker::Internet.free_email }
    password                    { Faker::Internet.password(min_length: 8) }
    password_confirmation       { password }
    first_name                  { '有吉' }
    last_name                   { '勇人' }
    first_name_reading          { 'アリヨシ' }
    last_name_reading           { 'ハヤト' }
    birthday                    { Faker::Date.birthday(min_age: 5, max_age: 75) }
  end
end
