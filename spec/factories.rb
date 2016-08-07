FactoryGirl.define do
  factory :group_subscription do
    group_id 1
    email "MyString"
    phone "MyString"
  end
  factory :group do
    kind "MyString"
    name "MyString"
    district "MyString"
    address "MyString"
    email "MyString"
    phone "MyString"
    facebook_page "MyString"
    facebook_group "MyString"
  end
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
