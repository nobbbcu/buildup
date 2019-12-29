FactoryBot.define do
  factory :tweet do
    content {"hello!"}
    image {File.open("#{Rails.root}/public/images/test_image.png")}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
