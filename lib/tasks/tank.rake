#encoding: utf-8 
namespace :db do
	desc "tank- users, forums, topics"
	task tank: :environment do
		make_users
		make_forums
		make_topics
		make_posts
	end
end

def make_users
	admin = User.create!(first_name: "Summer", last_name: "Wu", email: "summer.wu@yale.edu", password: "1sum$soc13", password_confirmation: "1sum$soc13", admin: true)
	#example
	mod = User.create!(first_name: "Summer", last_name: "Wu", email: "sw5813@gmail.com", password: "extra12345", password_confirmation: "extra12345", mod: true)
	example = User.create!(first_name: "Example", last_name: "User", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar")
end

def make_forums
	forum1 = Forum.create!(name: "Poverty", description: "Lots of people across the world are poor- what can we do about it? Check out all the topics below")
	forum2 = Forum.create!(name: "Forum 2", description: "Forum 2 dilemma- what can we do about it? Check out all the topics below")
	forum3 = Forum.create!(name: "Forum 3", description: "Forum 3 dilemma- what can we do about it? Check out all the topics below")
end

def make_topics
	topic1 = Forum.find(1).topics.create!(problem: "what’s the most efficient way to make sure every poor child in Africa has a malaria net?", description: "background info: this problem has been discussed for X number of years, in 1985, this initiative... by UN resolution 234093820934, etc.")
	forums = Forum.all
	3.times do
		problem = Faker::Lorem.sentence(5)
		description = Faker::Lorem.paragraph(3)
		forums.each { |forum| forum.topics.create!(problem: problem, description: description) }
	end 
end

def make_posts
	post1 = Topic.find(1).microposts.create!(summary: "Get a donation from the Bill and Melinda Gates Foundation", content: "Okay, not really, but this is why there are moderators XD Still need to make that functionality tho... not to mention a lot of other stuff... but EXAMPLE SOLUTION POST HERE!", user_id: 1)
	topics = Topic.all
	3.times do 
		summary = Faker::Lorem.sentence(4)
		content = Faker::Lorem.paragraph(4)
		topics.each { |topic| topic.microposts.create!(summary: summary, content: content, user_id: 2)}
	end
end