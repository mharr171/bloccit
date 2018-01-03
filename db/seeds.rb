require 'random_data'

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@bloccit.com',
  password: 'asdf123',
  role:     'admin'
)
print '.'

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@bloccit.com',
  password: 'asdf123'
)
print '.'

# Create Users
5.times do
  User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )
  print '.'
end
users = User.all
puts "\n#{User.count} users created"

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
  print '.'
end
topics = Topic.all
puts "\n#{Topic.count} topics created"

# Create Posts
50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
  print '.'
end
posts = Post.all
puts "\n#{Post.count} posts created with #{Vote.count} total votes"

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
  print '.'
end
comments = Comment.all
puts "\n#{Comment.count} comments created"

puts "Seed finished"
