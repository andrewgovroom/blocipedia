

 # Create Wiki
 15.times do

   Wiki.create!(
 
     title:  Faker::Company.name,
     body:   Faker::Company.catch_phrase,
     # private: Faker::Boolean.boolean
   )
 end
 wikis = Wiki.all
 


 
 puts "Seed finished"
 puts "#{Wiki.count} Wikis created"
