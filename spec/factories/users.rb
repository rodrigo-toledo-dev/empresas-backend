require 'faker'
FactoryBot.define do
  factory :user do |user|
    email { Faker::Internet.email }
    password { '12345asdfg' }
    password_confirmation { '12345asdfg' }
  end
end
