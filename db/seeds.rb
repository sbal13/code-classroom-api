Submission.destroy_all
User.destroy_all
Room.destroy_all

30.times do
  User.create(username: Faker::Name.unique.name, admin: false, password: "123")
end

languages = ["Ruby", "Javascript"]

30.times do
  Room.create(name: Faker::Color.color_name + "-" + Faker::Creature::Animal.unique.name, language: languages.sample)
end