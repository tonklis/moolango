# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.create(name: 'lost', description: 'TV Series')
Hint.create(topic_id: 1, description: "What did you think the Smoke Monster was when you first saw it?", thumbnail_url: "topics/lost/1.jpg")
Hint.create(topic_id: 1, description: "Are you more like Jack Shepherd or John Locke('man of science' or 'man of faith')?", thumbnail_url: "topics/lost/2.jpg")
Hint.create(topic_id: 1, description: "Did you like how the series ended?", thumbnail_url: "topics/lost/3.jpg")
Hint.create(topic_id: 1, description: "Who was the cooler character: Kate or Sawyer", thumbnail_url: "topics/lost/4.jpg")
Hint.create(topic_id: 1, description: "Don't you wish you could be friends with Hurley?", thumbnail_url: "topics/lost/5.jpg")
Hint.create(topic_id: 1, description: "Did you like that time traveling was part of the show?", thumbnail_url: "topics/lost/6.jpg")
Hint.create(topic_id: 1, description: "Do you have a favorite moment in the show?", thumbnail_url: "topics/lost/7.jpg")
Hint.create(topic_id: 1, description: "Are there any other TV shows as good as LOST?", thumbnail_url: "topics/lost/8.jpg")

Topic.create(name: 'batman', description: 'Movies')
Topic.create(name: 'avatar', description: 'Movies')
Topic.create(name: 'up', description: 'Movies')
Topic.create(name: 'mario_kart', description: 'Videogame')
Topic.create(name: 'game_of_thrones', description: 'TV Series')
Topic.create(name: 'steve_jobs', description: 'Character')
Topic.create(name: 'the_simpsons', description: 'TV Series')
Topic.create(name: 'harry_potter', description: 'Movies')

Language.create(name: 'spanish', thumbnail_url: 'languages/spanish.png')
Language.create(name: 'english', thumbnail_url: 'languages/english.png')
Language.create(name: 'portuguese', thumbnail_url: 'languages/portuguese.png')
Language.create(name: 'chinese', thumbnail_url: 'languages/chinese.png')
Language.create(name: 'french', thumbnail_url: 'languages/french.png')
Language.create(name: 'japanese', thumbnail_url: 'languages/japanese.png')
