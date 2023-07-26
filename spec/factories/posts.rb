FactoryBot.define do
  factory :post do
    title { 'A title' }
    content { 'Some content for the article' }
    user
    category
  end
end