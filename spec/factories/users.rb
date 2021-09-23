FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
    introduction          { Faker::Lorem.characters(number: 150) }
  end
end
