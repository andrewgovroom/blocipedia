require 'random_data'

 # Create Wiki
 50.times do

   Wiki.create!(
 
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 wikis = Wiki.all
 
#  # Create Comments
 
#  100.times do
#   Comment.create!(

#      post: posts.sample,
#      body: RandomData.random_paragraph
#   )
#  end
 
 puts "Seed finished"
 puts "#{Wiki.count} Wikis created"
#  puts "#{Comment.count} comments created"