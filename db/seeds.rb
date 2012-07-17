# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.create(name: 'lost', description: 'TV Series')
Hint.create(topic_id: 1, description: "What did you think the Smoke Monster was when you first saw it?", thumbnail_url: "lost_0.png")
Hint.create(topic_id: 1, description: "Are you more like Jack Shepherd or John Locke('man of science' or 'man of faith')?", thumbnail_url: "lost_1.png")

Topic.create(name: 'batman', description: 'Movies')
Topic.create(name: 'avatar', description: 'Movies')
Topic.create(name: 'up', description: 'Movies')
Topic.create(name: 'mario_kart', description: 'Videogame')
Topic.create(name: 'game_of_thrones', description: 'TV Series')
Topic.create(name: 'steve_jobs', description: 'Character')
Topic.create(name: 'the_simpsons', description: 'TV Series')
Topic.create(name: 'harry_potter', description: 'Movies')
