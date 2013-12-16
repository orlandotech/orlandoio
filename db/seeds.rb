require 'faker'
categories = %w[Developer Designer Investor Business]

u = User.new(
  full_name: "Orrett Davis",
  email: "orrett.davis@gmail.com", 
  category: categories.sample, 
  password: "helloworld",
  password_confirmation: "helloworld",
  avatar: "http://placehold.it/450x450/27EBF5"
  )
u.save

u = User.new(
  full_name: "Sarah Elbadri",
  email: "example1@gmail.com", 
  category: categories.sample, 
  password: "helloworld",
  password_confirmation: "helloworld",
  avatar: "http://placehold.it/450x450/27EBF5"
  )
u.save

u = User.new(
  full_name: "Michael Pell",
  email: "example2@gmail.com", 
  category: categories.sample, 
  password: "helloworld",
  password_confirmation: "helloworld",
  avatar: "http://placehold.it/450x450/27EBF5"
  )
u.save

20.times do 
  u = User.new(
    full_name: Faker::Name.name,
    email: Faker::Internet.email, 
    category: categories.sample, 
    password: "helloworld",
    password_confirmation: "helloworld",
    avatar: "http://placehold.it/450x450/27EBF5"
    )
  u.save
end

puts "#{User.count} users created"

 