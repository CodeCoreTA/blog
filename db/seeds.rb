images_array = ["app/assets/images/rain1.jpg", "app/assets/images/rain2.jpg", "app/assets/images/ballymoney.jpg",
"app/assets/images/winter01.jpg", "app/assets/images/winter02.jpg", "app/assets/images/winter03.jpg",
"app/assets/images/venice1.jpg", "app/assets/images/wicklow.jpg", "app/assets/images/winter02.jpg", "app/assets/images/winter01.jpg"]

User.create(first_name: "Joe", last_name: "Case", email: "test@test.com", password: "test")
User.create(first_name: "Mary", last_name: "Corry", email: "test1@test.com", password: "test")
User.create(first_name: "Joanna", last_name: "Brennan", email: "test2@test.com", password: "test")
User.create(first_name: "Brien", last_name: "Crean", email: "brien.crean@gmail.com", password: "test")

images_array.each do |image|
  Post.create({title: Faker::Company.bs.capitalize,
               body: Faker::Lorem.paragraph(25),
               user_id: [1,2,3,4].sample,
               image: File.open(Rails.root + image) })
end
