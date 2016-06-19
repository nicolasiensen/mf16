FactoryGirl.define do
  factory :user do
    first_name "Nícolas"
    last_name  "Iensen"
    sequence(:email) { |n| "nicolas#{n}@mf16.com.br" }
    password "123456"
  end
end
