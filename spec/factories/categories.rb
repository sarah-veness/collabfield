FactoryBot.define do
  factory :category do
    name { |n| "name#{n}" }
    branch { |n| "branch#{n}" }
  end
end