FactoryBot.define do
  v = [-1, 1].sample
  
  factory :vote do
    value v
    post
    user
  end
end
