FactoryBot.define do
  factory :user do
    email        { FFaker::Internet.email }
    password     'secret123'

    factory :admin do
      after(:create) do |user|
        user.remove_role :normal
        user.add_role :admin
      end
    end
  end
end