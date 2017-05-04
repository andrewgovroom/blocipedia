

 # Create Wiki
 15.times do

   Wiki.create!(
 
     title:  Faker::StarWars.character,
     body:   Faker::StarWars.wookie_sentence,
     private: false #public by default
   )
 end
 wikis = Wiki.all
 


 
 puts "Seed finished"
 puts "#{Wiki.count} Wikis created"
