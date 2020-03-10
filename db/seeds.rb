require 'faker'
User.create(email: 'testeapple@ioasys.com.br', password: '12341234')
10.times.each do
  company = Company.create(name: Faker::Company.bs)
  company.startup!
  company = Company.create(name: Faker::Company.bs)
  company.medium_sized!
  company = Company.create(name: Faker::Company.bs)
  company.large!
end
