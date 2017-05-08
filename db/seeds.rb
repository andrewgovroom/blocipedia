include Faker

#Create Users
10.times do
    user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
  end
  users = User.all


 # Create Wiki
 15.times do

   Wiki.create!(
 
     title:  Faker::Name.name,
     body:   Faker::ChuckNorris.fact,
     private: false #public by default
   )
 end
 wikis = Wiki.all
 
#Testing accounts

  # Create an admin member
  admin = User.create!(
  email:    'admin@gmail.com',
  password: 'password',
  role:     'admin'
  )
  
   #Create a premium member
  premium = User.create!(
  email:    'premium@gmail.com',
  password: 'password',
  role:     'premium'
  )

  #Create a standard member
  member = User.create!(
  email:    'standard@gmail.com',
  password: 'password',
  role:     'standard'
  )

 



 
puts "Seed finished"
puts "#{Wiki.count} Wikis created"
puts "#{User.count} users created."