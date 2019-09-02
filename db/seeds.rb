Submission.destroy_all
User.destroy_all
Room.destroy_all

30.times do
  User.create(username: Faker::Name.unique.name, admin: false, password: "123")
end

languages = ["Ruby", "Javascript"]

cohorts = [
  {name: "nyc-web-071519"},
  {name: "london-web-042219"},
  {name: "dumbo-web-040119"}
]

cohorts.each do |cohort|
  c = Cohort.create(cohort)

  3.times do
    Room.create(
      name: Faker::Color.color_name + "-" + Faker::Creature::Animal.unique.name, 
      language: languages.sample,
      cohort: c
    )
  end
end
