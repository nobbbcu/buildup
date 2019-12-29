FactoryBot.define do

  factory :user do
    name                  {"abe"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:email) {Faker::Internet.email}
    image {File.open("#{Rails.root}/public/images/test_image.png")}
    introduction          {"阿部です。よろしくお願いします。"}
  end
end
