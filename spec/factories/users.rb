require 'faker'
FactoryBot.define do
  factory :user do |user|
    email { 'testeapple@ioasys.com.br' }
    password { '12341234' }
    password_confirmation { '12341234' }
  end
end
