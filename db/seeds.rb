require 'random_data'

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

uniq_title = "Unique Title"
uniq_body = "Unique body"
Post.find_or_create_by!(
  title: uniq_title,
  body: uniq_body
)

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
uniq_com_body = "Unique comment body"
Comment.find_or_create_by!(
  post: Post.find_or_create_by!(
    title: uniq_title,
    body: uniq_body
  ),
  body: uniq_com_body
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
