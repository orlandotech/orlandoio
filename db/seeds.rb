require 'faker'
categories = %w[Developer Designer Investor Business]

u = User.new(
  full_name: "Sarah Elbadri",
  email: "example@gmail.com", 
  password: "helloworld",
  password_confirmation: "helloworld",
  )
u.save
u.profile.update_attributes(bio: Faker::Lorem.sentence(14), category: categories.sample, avatar: "http://placehold.it/450x450/27EBF5")

10.times do 
  u = User.new(
    full_name: Faker::Name.name,
    email: Faker::Internet.email, 
    password: "helloworld",
    password_confirmation: "helloworld",
    )
  u.save
  u.profile.update_attributes(bio: Faker::Lorem.sentence(14), category: categories.sample, avatar: "http://placehold.it/450x450/27EBF5")
end

puts "#{User.count} users created"

 