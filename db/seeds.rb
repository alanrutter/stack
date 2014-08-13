# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


story = Story.create(title: "Story with comment2", url: "http://www.theguardian.com", description: "This is my description, and it needs to be longer than twenty characters")
story.save
Comment.create(body: "This is a comment", story: story)