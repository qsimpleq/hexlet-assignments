# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

1.upto(10) do |_num|
  status = Task.statuses.sample
  completed = status == 'completed'

  task = Task.create(
    name: Faker::Name.name_with_middle,
    description: Faker::Lorem.question,
    status:,
    creator: Faker::Name.name_with_middle,
    performer: Faker::Name.name_with_middle,
    completed:
  )
end
