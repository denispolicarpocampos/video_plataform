FactoryBot.define do
  factory :video do
    name  { FFaker::Movie.title }
    url   { "#{FFaker::InternetSE.http_url}/file.m3u8" }
    user
  end
end