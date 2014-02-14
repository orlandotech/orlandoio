require 'faker'
categories = %w[Developer Designer Investor Student Business]

10.times do 
  u = User.new(
    full_name: Faker::Name.name,
    email: Faker::Internet.email, 
    password: "helloworld",
    password_confirmation: "helloworld",
    )
  u.save
  u.profile.update_attributes(avatar: "http://placehold.it/450x450/27EBF5")
  u.profile.update_for_profile(bio: Faker::Lorem.sentence(14), category: categories.sample)
end

puts "#{User.count} users created"

 