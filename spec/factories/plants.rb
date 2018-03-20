FactoryBot.define do
  factory :plant do
    scientific_name { Faker::Lorem.word }
    common_name { Faker::Lorem.word }
    light { Faker::Number.number(2) }
  end
end