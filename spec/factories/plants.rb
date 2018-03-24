FactoryBot.define do
  factory :plant do
    scientific_name { Faker::Lorem.word }
    common_name { Faker::Lorem.word }
    light { 5 }
  end
end