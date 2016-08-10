# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({
  name: "Natalie",
  email:"natalie@natalie.com",
  password: "1234",
  password_confirmation: "1234"
})

user2 = User.create({
  name: "Fred",
  email:"fred@nfred.com",
  password: "1234",
  password_confirmation: "1234"
})

project1 = Project.create!({
  owner_id: User.find_by(name: "Natalie").id,
  name: "Fred's not here",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  end_date: Date.today+2.weeks,
  funding_goal: 1000,
  media_url: "http://placekitten.com/200/300"
})

Project.create!({
  owner_id: User.find_by(name: "Natalie").id,
  name: "Another",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  end_date: Date.today+2.weeks,
  funding_goal: 1000,
  media_url: "http://placekitten.com/200/300"
})

Project.create!({
  owner_id: User.find_by(name: "Natalie").id,
  name: "Project 2",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  end_date: Date.today+2.weeks,
  funding_goal: 1000,
  media_url: "http://placekitten.com/200/300"
})


reward1 = Reward.create({
  name: "Level one",
  description: "basic level",
  amount: 10,
  project_id: Project.find_by(name: "Fred's not here").id
})

Reward.create({
  name: "Level two",
  description: "intermediate level",
  amount: 100,
  project_id: Project.find_by(name: "Fred's not here").id
})

Reward.create({
  name: "Level two",
  description: "expert level",
  amount: 1000,
  project_id: Project.find_by(name: "Fred's not here").id
})



pledge = Pledge.new({
  backer_id: User.find_by(name: "Fred").id,
  reward_id: Reward.find_by(name: "Level one").id
}, skip_validations: true).save(validate: false)
