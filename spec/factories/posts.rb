require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::TvShows::SouthPark.episode_name }
    content { Faker::TvShows::SouthPark.quote }
    user
    category
  end
end