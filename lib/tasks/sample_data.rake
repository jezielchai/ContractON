namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Contractor.create!(firstName: "Example",
    		       lastName: "User",
                 email: "example@railstutorial.org",
                 profession: "engineer",
                 password: "foobar")

    19.times do |n|
      firstName = "First Name"
      lastName = "Last Name"
      email = "example-#{n+1}@railstutorial.org"
      profession = "profession"
      password  = "password"

      Contractor.create!(firstName: firstName,
      		   lastName: lastName,
                   email: email,
		   profession: profession,
                   password: password)
    end
  end
end