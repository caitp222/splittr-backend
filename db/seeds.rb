# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Expense.destroy_all
Payment.destroy_all
Membership.destroy_all
Group.destroy_all
User.destroy_all



10.times do
  User.create({
    first_name: Faker::GameOfThrones.character,
    last_name: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    password: "likesbikes"
    })
end

20.times do
  Group.create({group_name: Faker::GameOfThrones.house,
    details: Faker::ChuckNorris.fact,
    creator_id: User.all.sample.id
    })
end
#
60.times do
  Membership.find_or_create_by({user_id: User.all.sample.id,
    group_id: Group.all.sample.id
    })
end
#
40.times do
  Expense.create({membership_id: Membership.all.sample.id,
    amount: rand(1..10),
    vendor: Faker::GameOfThrones.city,
    description: Faker::HitchhikersGuideToTheGalaxy.quote
    })
end
