FactoryBot.define do
  factory :video do
    name  { FFaker::Movie.title }
    url   'secret123'
    user
  end
end