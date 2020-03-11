require 'faker'
User.create(email: 'testeapple@ioasys.com.br', password: '12341234')
10.times.each do
  enterprise = Enterprise.create(name: Faker::Company.bs)
  enterprise.startup!
  enterprise = Enterprise.create(name: Faker::Company.bs)
  enterprise.medium_sized!
  enterprise = Enterprise.create(name: Faker::Company.bs)
  enterprise.large!
end

enterprise = Enterprise.create(name: 'aQm')
enterprise.medium_sized!
