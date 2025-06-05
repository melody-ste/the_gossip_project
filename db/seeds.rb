JoinTableRecipientPm.destroy_all
PrivateMessage.destroy_all
GossipTag.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

#Villes
10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

#Users
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(18..75),
    city: City.all.sample
  )
end

#Gossip
20.times do
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user: User.all.sample
  )
end

#tags
10.times do
  Tag.create(title: "#" + Faker::Hobby.activity.parameterize)
end

#attribution de tag a chaque gossip
Gossip.all.each do |gossip|
  tag_sample = Tag.all.sample(rand(1..5)) 
  gossip.tags << tag_sample
end

#PM
3.times do
  sender = User.all.sample
  recipients = User.where.not(id: sender.id).sample(rand(1..3))
  pm = PrivateMessage.create(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    sender: sender
  )
  recipients.each do |recipient|
    JoinTableRecipientPm.create(private_message: pm, recipient: recipient)
  end
end