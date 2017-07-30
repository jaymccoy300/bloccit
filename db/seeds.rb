require 'random_data'
include RandomData

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

100.times do
  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  resolved: false
  )
end

Post.find_or_create_by!(title: "Unique Title", body:"Unique Body")

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
