FactoryBot.define do
  factory :link do
    base_link { Faker::Internet.url }
    shorted_link { Faker::String.random(length: 3..15) }
    description { Faker::Lorem.paragraph }
    user {User.last}
  end
end
