FactoryGirl.define do
  factory :user do
    first_name "Nícolas"
    last_name  "Iensen"
    sequence(:email) { |n| "nicolas#{n}@mf16.com.br" }
    password "123456"
  end

  factory :event do
    sequence(:title) { |n| "Event ##{n}" }
    start_at Time.now
  end
end
