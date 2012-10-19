require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "foo#{n}@example.com" }
    f.password "secret"
    f.password_confirmation { |u| u.password }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.hobby "swimming"
  end
end
