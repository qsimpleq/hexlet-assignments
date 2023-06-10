# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

if Status.count == 0
  statuses = ['New', 'In Progress', 'Done']
  statuses.each do |status|
    Status.create(name: status)
  end
end

if User.count == 0
  1.upto(10) do
    User.create(name: Faker::Name.unique.name)
  end
end

if Task.count == 0
  status_count = Status.count
  user_count = User.count
  1.upto(100) do
    Task.create(name: Faker::Lorem.sentence,
                description: Faker::Lorem.paragraph,
                status_id: Status.find(rand(status_count) + 1).id,
                user_id: User.find(rand(user_count) + 1).id
    )
  end
end
