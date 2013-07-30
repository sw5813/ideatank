namespace :db do
	desc "tank- admins, forums"
	task tank: :environment do
		make_admins
		make_forums
	end
end

def make_admins
	admin = User.create!(name: "Summer Wu", email: "summer.wu@yale.edu", password: "1sum$soc13", password_confirmation: "1sum$soc13", admin: true)
	#example
	example = User.create!(name: "Example User", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar")
end

def make_forums
	forum1 = Forum.create!(name: "Poverty", description: "Lots of people across the world are poor- what can we do about it? Check out all the topics below")
	forum2 = Forum.create!(name: "Forum 2", description: "Forum 2 dilemma- what can we do about it? Check out all the topics below")
	forum3 = Forum.create!(name: "Forum 3", description: "Forum 3 dilemma- what can we do about it? Check out all the topics below")
end

