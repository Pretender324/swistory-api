# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |_n|
  User.create!(
    {
      name: Faker::Name.name,
      sex: Faker::Gender.binary_type,
      email: Faker::Internet.email
    }
  )
end

50.times do |_n|
  Group.create!(
    {
      name: Faker::Company.name
    }
  )
end

100.times do |_n|
  Menu.create!(
    {
      aim: Faker::Alphanumeric.alpha(number: 10),
      description: Faker::Alphanumeric.alpha(number: 50),
      level: Faker::Number.between(from: 1, to: 10),
      group_id: Faker::Number.between(from: 1, to: 50)
    }
  )
end

1000.times do |_n|
  Practice.create!(
    {
      category: Faker::Alphanumeric.alpha(number: 10),
      system: Faker::Alphanumeric.alpha(number: 10),
      distance: Faker::Number.between(from: 0, to: 400),
      times: Faker::Number.between(from: 1, to: 10),
      set: Faker::Number.between(from: 1, to: 10),
      description: Faker::Alphanumeric.alpha(number: 50),
      on_time: Faker::Alphanumeric.alpha(number: 10),
      menu_id: Faker::Number.between(from: 1, to: 100)
    }
  )
end
