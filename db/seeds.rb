#!/bin/env ruby
# encoding: utf-8

Topic.create(name: 'apple', description: 'Products', thumbnail_url: 'topics/apple/apple.gif', :enabled => true)
Hint.create(language_id: 1, topic_id: 1, description: "Everyone loves Apple! Click next for help on topics!", thumbnail_url: "topics/apple/1.gif")
Hint.create(language_id: 1, topic_id: 1, description: "What was your first Apple product (or what do you want it to be)?", thumbnail_url: "topics/apple/2.gif")
Hint.create(language_id: 1, topic_id: 1, description: "What industry do you think Apple should disrupt next?", thumbnail_url: "topics/apple/3.gif")
Hint.create(language_id: 1, topic_id: 1, description: "Apple or Android: which is better?", thumbnail_url: "topics/apple/4.gif")
Hint.create(language_id: 1, topic_id: 1, description: "Describe the kind of company you would want to start.", thumbnail_url: "topics/apple/5.gif")
Hint.create(language_id: 1, topic_id: 1, description: "In 100 years, how will the world look back on Steve Jobs?", thumbnail_url: "topics/apple/6.gif")
Hint.create(language_id: 1, topic_id: 1, description: "iPad or iPhone: which one would you want more?", thumbnail_url: "topics/apple/7.gif")

Hint.create(language_id: 2, topic_id: 1, description: "Todo mundo adora a Apple! Presiona siguiente para ayuda con el tema", thumbnail_url: "topics/apple/1.gif")
Hint.create(language_id: 2, topic_id: 1, description: "¿Cuál fue tu primer producto Apple (o cuál te gustaría que fuera)?", thumbnail_url: "topics/apple/2.gif")
Hint.create(language_id: 2, topic_id: 1, description: "¿Qué otra industria te gustaría que Apple innovara?", thumbnail_url: "topics/apple/3.gif")
Hint.create(language_id: 2, topic_id: 1, description: "iOS o Android: ¿cuál crees que es mejor?", thumbnail_url: "topics/apple/4.gif")
Hint.create(language_id: 2, topic_id: 1, description: "¿Qué harías si fueras el dueño de Apple?", thumbnail_url: "topics/apple/5.gif")
Hint.create(language_id: 2, topic_id: 1, description: "En 100 años, ¿cómo crees que el mundo recuerde a Steve Jobs?", thumbnail_url: "topics/apple/6.gif")
Hint.create(language_id: 2, topic_id: 1, description: "iPad o iPhone: ¿cuál te gustaría tener más?", thumbnail_url: "topics/apple/7.gif")

Topic.create(name: 'avatar', description: 'Movies', thumbnail_url: 'topics/avatar/avatar.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 2, description: "What is your favorite creature on the planet Pandora?", thumbnail_url: "topics/avatar/1.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "Would you ever volunteer to explore Pandora?", thumbnail_url: "topics/avatar/2.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "Would you want to live in Home Tree?", thumbnail_url: "topics/avatar/3.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "What do you think is going to happen in the sequel to Avatar?", thumbnail_url: "topics/avatar/4.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "Do you think there is a planet out there with species like the Navi?", thumbnail_url: "topics/avatar/5.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "Would you want to fly like Jake on this creature?", thumbnail_url: "topics/avatar/6.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "How many times did you see Avatar when it was in theatres?", thumbnail_url: "topics/avatar/7.jpg")
Hint.create(language_id: 1, topic_id: 2, description: "Did you see Avatar in 3-D?", thumbnail_url: "topics/avatar/8.jpg")

Topic.create(name: 'beatles', description: 'Music', thumbnail_url: 'topics/beatles/beatles.gif', :enabled => true)
Hint.create(language_id: 1, topic_id: 3, description: "Sweet, the Beatles! Click next for topics!", thumbnail_url: "topics/beatles/1.gif")
Hint.create(language_id: 1, topic_id: 3, description: "Paul, John, George, or Ringo: who was the most important?", thumbnail_url: "topics/beatles/2.gif")
Hint.create(language_id: 1, topic_id: 3, description: "Beatles or Star Wars: which had a more profound impact?", thumbnail_url: "topics/beatles/3.gif")
Hint.create(language_id: 1, topic_id: 3, description: "Guess when this photo was taken?", thumbnail_url: "topics/beatles/4.gif")
Hint.create(language_id: 1, topic_id: 3, description: "Besides the Beatles (and Muhammad Ali), who is your favorite celebrity from the 1960s and 1970s?", thumbnail_url: "topics/beatles/5.gif")
Hint.create(language_id: 1, topic_id: 3, description: "This old man was accidentally on the Abbey Road cover. Whoa…", thumbnail_url: "topics/beatles/6.gif")
Hint.create(language_id: 1, topic_id: 3, description: "My favorite Beatles song is ... because ...", thumbnail_url: "topics/beatles/7.gif")

Hint.create(language_id: 2, topic_id: 3, description: "¡Excelente, los Beatles! Presiona siguiente para obtener un tema", thumbnail_url: "topics/beatles/1.gif")
Hint.create(language_id: 2, topic_id: 3, description: "Paul, John, George, o Ringo: ¿quién fue el más importante?", thumbnail_url: "topics/beatles/2.gif")
Hint.create(language_id: 2, topic_id: 3, description: "Beatles o Star Wars: ¿qué crees que ha tenido un impacto más profundo?", thumbnail_url: "topics/beatles/3.gif")
Hint.create(language_id: 2, topic_id: 3, description: "¿Cuándo crees que se tomó esta foto?", thumbnail_url: "topics/beatles/4.gif")
Hint.create(language_id: 2, topic_id: 3, description: "Aparte de los Beatles (y Muhammad Ali), ¿quién es tu celebridad favorita de los 60's y 70's?", thumbnail_url: "topics/beatles/5.gif")
Hint.create(language_id: 2, topic_id: 3, description: "Este señor salió por accidente en la portada de Abbey Road... ¿sabes historias similares?", thumbnail_url: "topics/beatles/6.gif")
Hint.create(language_id: 2, topic_id: 3, description: "Mi canción favorita de los Beatles es ... debido a ...", thumbnail_url: "topics/beatles/7.gif")

Topic.create(name: 'food', description: 'Food', thumbnail_url: 'topics/food/food.gif', :enabled => true)
Hint.create(language_id: 1, topic_id: 4, description: "Hungry to talk about food? Click next for help on topics.", thumbnail_url: "topics/food/1.gif")
Hint.create(language_id: 1, topic_id: 4, description: "They say every culture in the world has it's own type of bread. Describe bread in your country.", thumbnail_url: "topics/food/2.gif")
Hint.create(language_id: 1, topic_id: 4, description: "Are you a breakfast, lunch, or dinner kind of person?", thumbnail_url: "topics/food/3.gif")
Hint.create(language_id: 1, topic_id: 4, description: "What's the craziest food you've ever eaten?", thumbnail_url: "topics/food/4.gif")
Hint.create(language_id: 1, topic_id: 4, description: "Bacon milkshake. Thoughts?", thumbnail_url: "topics/food/5.gif")
Hint.create(language_id: 1, topic_id: 4, description: "What is your favorite dessert?", thumbnail_url: "topics/food/6.gif")
Hint.create(language_id: 1, topic_id: 4, description: "Beer or wine (or neither) with your dinner?", thumbnail_url: "topics/food/7.gif")

Hint.create(language_id: 2, topic_id: 4, description: "¿Estás hambriento? Presiona siguiente para ver temas relacionados con comida", thumbnail_url: "topics/food/1.gif")
Hint.create(language_id: 2, topic_id: 4, description: "Se sabe que cada cultura en el mundo tiene su propio tipo de pan. ¿Cuál es el pan de tu zona?", thumbnail_url: "topics/food/2.gif")
Hint.create(language_id: 2, topic_id: 4, description: "¿Qué comida disfrutas más? ¿Desayuno, comida o cena?", thumbnail_url: "topics/food/3.gif")
Hint.create(language_id: 2, topic_id: 4, description: "¿Cuál es el platillo más extraño que has comido?", thumbnail_url: "topics/food/4.gif")
Hint.create(language_id: 2, topic_id: 4, description: "Malteada de tocino. ¿Qué te hace pensar?", thumbnail_url: "topics/food/5.gif")
Hint.create(language_id: 2, topic_id: 4, description: "¿Cuál es tu postre favorito?", thumbnail_url: "topics/food/6.gif")
Hint.create(language_id: 2, topic_id: 4, description: "¿Prefieres cerveza o vino (o ninguno de los dos), para acompañar tu cena?", thumbnail_url: "topics/food/7.gif")

Topic.create(name: 'game_of_thrones', description: 'TV Series', thumbnail_url: 'topics/game_of_thrones/game_of_thrones.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 5, description: "Tyrion Lannister: mad man or genius?", thumbnail_url: "topics/game_of_thrones/1.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Who do you think Daenerys Targaryen will attack first with her dragons?", thumbnail_url: "topics/game_of_thrones/2.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Which character in the show would you want to be?", thumbnail_url: "topics/game_of_thrones/3.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Who is more annoying? Theon Greyjoy or King Joffrey?", thumbnail_url: "topics/game_of_thrones/4.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Which episode has been your favorite so far?", thumbnail_url: "topics/game_of_thrones/5.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Which would win in a battle: the White Walkers or the dragons?", thumbnail_url: "topics/game_of_thrones/6.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Who would you rather fight for: Robb Stark or Tywin Lannister?", thumbnail_url: "topics/game_of_thrones/7.jpg")
Hint.create(language_id: 1, topic_id: 5, description: "Who are the most rutheless: the Dothraki or the pirates of the Iron Islands?", thumbnail_url: "topics/game_of_thrones/8.jpg")

Topic.create(name: 'harry_potter', description: 'Movies', thumbnail_url: 'topics/harry_potter/harry_potter.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 6, description: "Which Harry Potter book was your favorite?", thumbnail_url: "topics/harry_potter/1.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "In the end who was the coolest: Albus Dumbledore or Severus Snape?", thumbnail_url: "topics/harry_potter/3.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "Which did you prefer: the movies or the books?", thumbnail_url: "topics/harry_potter/4.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "What animal would your Patronus be?", thumbnail_url: "topics/harry_potter/5.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "Who would you rather have as your friend: Ron or Hermione?", thumbnail_url: "topics/harry_potter/6.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "Which character should have his own book series written about him?", thumbnail_url: "topics/harry_potter/7.jpg")
Hint.create(language_id: 1, topic_id: 6, description: "Which house would you have belonged to at Hogwarts?", thumbnail_url: "topics/harry_potter/8.jpg")

Topic.create(name: 'mario_kart', description: 'Videogame', thumbnail_url: 'topics/mario_kart/mario_kart.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 7, description: "Do you remember where and when do you first played MarioKart?", thumbnail_url: "topics/mario_kart/1.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "Which character did you always pick?", thumbnail_url: "topics/mario_kart/2.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "What was better: strength or speed?", thumbnail_url: "topics/mario_kart/3.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "Was Block Fort your favorite level in Battle Mode?", thumbnail_url: "topics/mario_kart/4.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "What was the hardest level in the game?", thumbnail_url: "topics/mario_kart/5.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "Which did you prefer: the red shells or the green shells?", thumbnail_url: "topics/mario_kart/6.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "How annoying was it when someone shocked you with the lightning?", thumbnail_url: "topics/mario_kart/7.jpg")
Hint.create(language_id: 1, topic_id: 7, description: "On Koopa Troopa Beach, did you use the secret ramp behind the waterfall?", thumbnail_url: "topics/mario_kart/8.jpg")

Topic.create(name: 'michael_jackson', description: 'Music', thumbnail_url: 'topics/michael_jackson/michael_jackson.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 8, description: "", thumbnail_url: "topics/michael_jackson/1.jpg")
Hint.create(language_id: 1, topic_id: 8, description: "", thumbnail_url: "topics/michael_jackson/2.jpg")
Hint.create(language_id: 1, topic_id: 8, description: "", thumbnail_url: "topics/michael_jackson/3.jpg")
Hint.create(language_id: 1, topic_id: 8, description: "", thumbnail_url: "topics/michael_jackson/4.jpg")
Hint.create(language_id: 1, topic_id: 8, description: "", thumbnail_url: "topics/michael_jackson/5.jpg")

Topic.create(name: 'michael_jordan', description: 'Sports', thumbnail_url: 'topics/michael_jordan/michael_jordan.gif', :enabled => false)

Topic.create(name: 'nyc', description: 'World', thumbnail_url: 'topics/nyc/nyc.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 10, description: "", thumbnail_url: "topics/nyc/1.jpg")
Hint.create(language_id: 1, topic_id: 10, description: "", thumbnail_url: "topics/nyc/2.jpg")
Hint.create(language_id: 1, topic_id: 10, description: "", thumbnail_url: "topics/nyc/3.jpg")
Hint.create(language_id: 1, topic_id: 10, description: "", thumbnail_url: "topics/nyc/4.jpg")
Hint.create(language_id: 1, topic_id: 10, description: "", thumbnail_url: "topics/nyc/5.jpg")

Topic.create(name: 'olympics', description: 'World', thumbnail_url: 'topics/olympics/olympics.gif', :enabled => true)
Hint.create(language_id: 1, topic_id: 11, description: "The OLYMPICS! Intense! Click next if you need a topic!", thumbnail_url: "topics/olympics/1.gif")
Hint.create(language_id: 1, topic_id: 11, description: "Which sport would you want to compete in most?", thumbnail_url: "topics/olympics/2.gif")
Hint.create(language_id: 1, topic_id: 11, description: "How have the British done in organizing the event so far? Did you like the opening ceremony?", thumbnail_url: "topics/olympics/3.gif")
Hint.create(language_id: 1, topic_id: 11, description: "Which is better: the Winter Olympics or the Summer Olympics?", thumbnail_url: "topics/olympics/4.gif")
Hint.create(language_id: 1, topic_id: 11, description: "Have the Olympics become too commercialized?", thumbnail_url: "topics/olympics/5.gif")
Hint.create(language_id: 1, topic_id: 11, description: "True or False: What the Olympics means to Americans", thumbnail_url: "topics/olympics/6.gif")
Hint.create(language_id: 1, topic_id: 11, description: "Do you think that Rio de Janeiro is going to be ready for the 2016 Olympics?", thumbnail_url: "topics/olympics/7.gif")

Hint.create(language_id: 2, topic_id: 11, description: "¡Las olimpiadas! ¡Intenso! Presiona siguiente si necesitas un tema", thumbnail_url: "topics/olympics/1.gif")
Hint.create(language_id: 2, topic_id: 11, description: "¿En qué actividad olímpica te gustaría competir?", thumbnail_url: "topics/olympics/2.gif")
Hint.create(language_id: 2, topic_id: 11, description: "¿Qué piensas sobre la organización del evento? ¿Te gustó la ceremonia de inauguración?", thumbnail_url: "topics/olympics/3.gif")
Hint.create(language_id: 2, topic_id: 11, description: "Qué te gusta más: ¿las olimpiadas de verano o las de invierno?", thumbnail_url: "topics/olympics/4.gif")
Hint.create(language_id: 2, topic_id: 11, description: "¿Crees que las olimpiadas se han vuelto demasiado comerciales?", thumbnail_url: "topics/olympics/5.gif")
Hint.create(language_id: 2, topic_id: 11, description: "Verdadero o falso: lo que las olimpiadas significan para Estados Unidos", thumbnail_url: "topics/olympics/6.gif")
Hint.create(language_id: 2, topic_id: 11, description: "¿Qué opinas de Rio de Janeiro para las olimpiadas del 2016?", thumbnail_url: "topics/olympics/7.gif")

Topic.create(name: 'popart', description: 'World', thumbnail_url: 'topics/popart/popart.gif', :enabled => false)

Topic.create(name: 'sustainability', description: 'World', thumbnail_url: 'topics/sustainability/sustainability.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 13, description: "", thumbnail_url: "topics/sustainability/1.jpg")
Hint.create(language_id: 1, topic_id: 13, description: "", thumbnail_url: "topics/sustainability/2.jpg")
Hint.create(language_id: 1, topic_id: 13, description: "", thumbnail_url: "topics/sustainability/3.jpg")
Hint.create(language_id: 1, topic_id: 13, description: "", thumbnail_url: "topics/sustainability/4.jpg")

Topic.create(name: 'the_simpsons', description: 'TV Series', thumbnail_url: 'topics/the_simpsons/the_simpsons.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 14, description: "Who do you like better: Homer or Bart?", thumbnail_url: "topics/the_simpsons/1.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "Do you know anyone like Ned Flanders?", thumbnail_url: "topics/the_simpsons/3.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "How often do you watch the Simpsons?", thumbnail_url: "topics/the_simpsons/4.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "Is your personality more like Bart or Lisa?", thumbnail_url: "topics/the_simpsons/5.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "Is it even possible to have hair like Marge Simpson's?", thumbnail_url: "topics/the_simpsons/6.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "What is your favorite episode of the Simpsons?", thumbnail_url: "topics/the_simpsons/7.jpg")
Hint.create(language_id: 1, topic_id: 14, description: "Who is funnier? Grandrpa Simpson or Ralph Wiggum?", thumbnail_url: "topics/the_simpsons/8.jpg")

Topic.create(name: 'up', description: 'Movies', thumbnail_url: 'topics/up/up.gif', :enabled => false)
Hint.create(language_id: 1, topic_id: 15, description: "Which was your favorite: Kenvin (the bird) or Dug (the dog)?", thumbnail_url: "topics/up/1.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "What's your favorite moment in the movie?", thumbnail_url: "topics/up/2.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Be honest: did you cry when you saw the Carl and Ellie scene?", thumbnail_url: "topics/up/3.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Is Up the best movie that Pixar has made?", thumbnail_url: "topics/up/4.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Where is your Paradise Falls (where you would fly in your adventure)?", thumbnail_url: "topics/up/5.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Do you believe that exotic undiscovered animals like Kevin really exist?", thumbnail_url: "topics/up/6.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Do you know anyone like Carl Fredericksen?", thumbnail_url: "topics/up/7.jpg")
Hint.create(language_id: 1, topic_id: 15, description: "Are there any programs like the Wilderness Explorers where you live?", thumbnail_url: "topics/up/8.jpg")

Language.create(name: 'english', thumbnail_url: 'languages/english.gif')
Language.create(name: 'spanish', thumbnail_url: 'languages/spanish.gif')
Language.create(name: 'portuguese', thumbnail_url: 'languages/portuguese.gif')
Language.create(name: 'chinese', thumbnail_url: 'languages/chinese.gif')
Language.create(name: 'french', thumbnail_url: 'languages/french.gif')
Language.create(name: 'japanese', thumbnail_url: 'languages/japanese.gif')

Country.create(:id=>1,:iso=>"AD",:name=>"Andorra")
Country.create(:id=>2,:iso=>"AE",:name=>"United Arab Emirates")
Country.create(:id=>3,:iso=>"AF",:name=>"Afghanistan")
Country.create(:id=>4,:iso=>"AG",:name=>"Antigua and Barbuda")
Country.create(:id=>5,:iso=>"AI",:name=>"Anguilla")
Country.create(:id=>6,:iso=>"AL",:name=>"Albania")
Country.create(:id=>7,:iso=>"AM",:name=>"Armenia")
Country.create(:id=>8,:iso=>"AO",:name=>"Angola")
Country.create(:id=>9,:iso=>"AQ",:name=>"Antarctica")
Country.create(:id=>10,:iso=>"AR",:name=>"Argentina")
Country.create(:id=>11,:iso=>"AS",:name=>"American Samoa")
Country.create(:id=>12,:iso=>"AT",:name=>"Austria")
Country.create(:id=>13,:iso=>"AU",:name=>"Australia")
Country.create(:id=>14,:iso=>"AW",:name=>"Aruba")
Country.create(:id=>15,:iso=>"AX",:name=>"Aland Islands")
Country.create(:id=>16,:iso=>"AZ",:name=>"Azerbaijan")
Country.create(:id=>17,:iso=>"BA",:name=>"Bosnia and Herzegovina")
Country.create(:id=>18,:iso=>"BB",:name=>"Barbados")
Country.create(:id=>19,:iso=>"BD",:name=>"Bangladesh")
Country.create(:id=>20,:iso=>"BE",:name=>"Belgium")
Country.create(:id=>21,:iso=>"BF",:name=>"Burkina Faso")
Country.create(:id=>22,:iso=>"BG",:name=>"Bulgaria")
Country.create(:id=>23,:iso=>"BH",:name=>"Bahrain")
Country.create(:id=>24,:iso=>"BI",:name=>"Burundi")
Country.create(:id=>25,:iso=>"BJ",:name=>"Benin")
Country.create(:id=>26,:iso=>"BL",:name=>"Saint Barthélemy")
Country.create(:id=>27,:iso=>"BM",:name=>"Bermuda")
Country.create(:id=>28,:iso=>"BN",:name=>"Brunei")
Country.create(:id=>29,:iso=>"BO",:name=>"Bolivia")
Country.create(:id=>30,:iso=>"BQ",:name=>"Bonaire, Saint Eustatius and Saba ")
Country.create(:id=>31,:iso=>"BR",:name=>"Brazil")
Country.create(:id=>32,:iso=>"BS",:name=>"Bahamas")
Country.create(:id=>33,:iso=>"BT",:name=>"Bhutan")
Country.create(:id=>34,:iso=>"BV",:name=>"Bouvet Island")
Country.create(:id=>35,:iso=>"BW",:name=>"Botswana")
Country.create(:id=>36,:iso=>"BY",:name=>"Belarus")
Country.create(:id=>37,:iso=>"BZ",:name=>"Belize")
Country.create(:id=>38,:iso=>"CA",:name=>"Canada")
Country.create(:id=>39,:iso=>"CC",:name=>"Cocos Islands")
Country.create(:id=>40,:iso=>"CD",:name=>"Democratic Republic of the Congo")
Country.create(:id=>41,:iso=>"CF",:name=>"Central African Republic")
Country.create(:id=>42,:iso=>"CG",:name=>"Republic of the Congo")
Country.create(:id=>43,:iso=>"CH",:name=>"Switzerland")
Country.create(:id=>44,:iso=>"CI",:name=>"Ivory Coast")
Country.create(:id=>45,:iso=>"CK",:name=>"Cook Islands")
Country.create(:id=>46,:iso=>"CL",:name=>"Chile")
Country.create(:id=>47,:iso=>"CM",:name=>"Cameroon")
Country.create(:id=>48,:iso=>"CN",:name=>"China")
Country.create(:id=>49,:iso=>"CO",:name=>"Colombia")
Country.create(:id=>50,:iso=>"CR",:name=>"Costa Rica")
Country.create(:id=>51,:iso=>"CU",:name=>"Cuba")
Country.create(:id=>52,:iso=>"CV",:name=>"Cape Verde")
Country.create(:id=>53,:iso=>"CW",:name=>"Curaçao")
Country.create(:id=>54,:iso=>"CX",:name=>"Christmas Island")
Country.create(:id=>55,:iso=>"CY",:name=>"Cyprus")
Country.create(:id=>56,:iso=>"CZ",:name=>"Czech Republic")
Country.create(:id=>57,:iso=>"DE",:name=>"Germany")
Country.create(:id=>58,:iso=>"DJ",:name=>"Djibouti")
Country.create(:id=>59,:iso=>"DK",:name=>"Denmark")
Country.create(:id=>60,:iso=>"DM",:name=>"Dominica")
Country.create(:id=>61,:iso=>"DO",:name=>"Dominican Republic")
Country.create(:id=>62,:iso=>"DZ",:name=>"Algeria")
Country.create(:id=>63,:iso=>"EC",:name=>"Ecuador")
Country.create(:id=>64,:iso=>"EE",:name=>"Estonia")
Country.create(:id=>65,:iso=>"EG",:name=>"Egypt")
Country.create(:id=>66,:iso=>"EH",:name=>"Western Sahara")
Country.create(:id=>67,:iso=>"ER",:name=>"Eritrea")
Country.create(:id=>68,:iso=>"ES",:name=>"Spain")
Country.create(:id=>69,:iso=>"ET",:name=>"Ethiopia")
Country.create(:id=>70,:iso=>"FI",:name=>"Finland")
Country.create(:id=>71,:iso=>"FJ",:name=>"Fiji")
Country.create(:id=>72,:iso=>"FK",:name=>"Falkland Islands")
Country.create(:id=>73,:iso=>"FM",:name=>"Micronesia")
Country.create(:id=>74,:iso=>"FO",:name=>"Faroe Islands")
Country.create(:id=>75,:iso=>"FR",:name=>"France")
Country.create(:id=>76,:iso=>"GA",:name=>"Gabon")
Country.create(:id=>77,:iso=>"GB",:name=>"United Kingdom")
Country.create(:id=>78,:iso=>"GD",:name=>"Grenada")
Country.create(:id=>79,:iso=>"GE",:name=>"Georgia")
Country.create(:id=>80,:iso=>"GF",:name=>"French Guiana")
Country.create(:id=>81,:iso=>"GG",:name=>"Guernsey")
Country.create(:id=>82,:iso=>"GH",:name=>"Ghana")
Country.create(:id=>83,:iso=>"GI",:name=>"Gibraltar")
Country.create(:id=>84,:iso=>"GL",:name=>"Greenland")
Country.create(:id=>85,:iso=>"GM",:name=>"Gambia")
Country.create(:id=>86,:iso=>"GN",:name=>"Guinea")
Country.create(:id=>87,:iso=>"GP",:name=>"Guadeloupe")
Country.create(:id=>88,:iso=>"GQ",:name=>"Equatorial Guinea")
Country.create(:id=>89,:iso=>"GR",:name=>"Greece")
Country.create(:id=>90,:iso=>"GS",:name=>"South Georgia and the South Sandwich Islands")
Country.create(:id=>91,:iso=>"GT",:name=>"Guatemala")
Country.create(:id=>92,:iso=>"GU",:name=>"Guam")
Country.create(:id=>93,:iso=>"GW",:name=>"Guinea-Bissau")
Country.create(:id=>94,:iso=>"GY",:name=>"Guyana")
Country.create(:id=>95,:iso=>"HK",:name=>"Hong Kong")
Country.create(:id=>96,:iso=>"HM",:name=>"Heard Island and McDonald Islands")
Country.create(:id=>97,:iso=>"HN",:name=>"Honduras")
Country.create(:id=>98,:iso=>"HR",:name=>"Croatia")
Country.create(:id=>99,:iso=>"HT",:name=>"Haiti")
Country.create(:id=>100,:iso=>"HU",:name=>"Hungary")
Country.create(:id=>101,:iso=>"ID",:name=>"Indonesia")
Country.create(:id=>102,:iso=>"IE",:name=>"Ireland")
Country.create(:id=>103,:iso=>"IL",:name=>"Israel")
Country.create(:id=>104,:iso=>"IM",:name=>"Isle of Man")
Country.create(:id=>105,:iso=>"IN",:name=>"India")
Country.create(:id=>106,:iso=>"IO",:name=>"British Indian Ocean Territory")
Country.create(:id=>107,:iso=>"IQ",:name=>"Iraq")
Country.create(:id=>108,:iso=>"IR",:name=>"Iran")
Country.create(:id=>109,:iso=>"IS",:name=>"Iceland")
Country.create(:id=>110,:iso=>"IT",:name=>"Italy")
Country.create(:id=>111,:iso=>"JE",:name=>"Jersey")
Country.create(:id=>112,:iso=>"JM",:name=>"Jamaica")
Country.create(:id=>113,:iso=>"JO",:name=>"Jordan")
Country.create(:id=>114,:iso=>"JP",:name=>"Japan")
Country.create(:id=>115,:iso=>"KE",:name=>"Kenya")
Country.create(:id=>116,:iso=>"KG",:name=>"Kyrgyzstan")
Country.create(:id=>117,:iso=>"KH",:name=>"Cambodia")
Country.create(:id=>118,:iso=>"KI",:name=>"Kiribati")
Country.create(:id=>119,:iso=>"KM",:name=>"Comoros")
Country.create(:id=>120,:iso=>"KN",:name=>"Saint Kitts and Nevis")
Country.create(:id=>121,:iso=>"KP",:name=>"North Korea")
Country.create(:id=>122,:iso=>"KR",:name=>"South Korea")
Country.create(:id=>123,:iso=>"XK",:name=>"Kosovo")
Country.create(:id=>124,:iso=>"KW",:name=>"Kuwait")
Country.create(:id=>125,:iso=>"KY",:name=>"Cayman Islands")
Country.create(:id=>126,:iso=>"KZ",:name=>"Kazakhstan")
Country.create(:id=>127,:iso=>"LA",:name=>"Laos")
Country.create(:id=>128,:iso=>"LB",:name=>"Lebanon")
Country.create(:id=>129,:iso=>"LC",:name=>"Saint Lucia")
Country.create(:id=>130,:iso=>"LI",:name=>"Liechtenstein")
Country.create(:id=>131,:iso=>"LK",:name=>"Sri Lanka")
Country.create(:id=>132,:iso=>"LR",:name=>"Liberia")
Country.create(:id=>133,:iso=>"LS",:name=>"Lesotho")
Country.create(:id=>134,:iso=>"LT",:name=>"Lithuania")
Country.create(:id=>135,:iso=>"LU",:name=>"Luxembourg")
Country.create(:id=>136,:iso=>"LV",:name=>"Latvia")
Country.create(:id=>137,:iso=>"LY",:name=>"Libya")
Country.create(:id=>138,:iso=>"MA",:name=>"Morocco")
Country.create(:id=>139,:iso=>"MC",:name=>"Monaco")
Country.create(:id=>140,:iso=>"MD",:name=>"Moldova")
Country.create(:id=>141,:iso=>"ME",:name=>"Montenegro")
Country.create(:id=>142,:iso=>"MF",:name=>"Saint Martin")
Country.create(:id=>143,:iso=>"MG",:name=>"Madagascar")
Country.create(:id=>144,:iso=>"MH",:name=>"Marshall Islands")
Country.create(:id=>145,:iso=>"MK",:name=>"Macedonia")
Country.create(:id=>146,:iso=>"ML",:name=>"Mali")
Country.create(:id=>147,:iso=>"MM",:name=>"Myanmar")
Country.create(:id=>148,:iso=>"MN",:name=>"Mongolia")
Country.create(:id=>149,:iso=>"MO",:name=>"Macao")
Country.create(:id=>150,:iso=>"MP",:name=>"Northern Mariana Islands")
Country.create(:id=>151,:iso=>"MQ",:name=>"Martinique")
Country.create(:id=>152,:iso=>"MR",:name=>"Mauritania")
Country.create(:id=>153,:iso=>"MS",:name=>"Montserrat")
Country.create(:id=>154,:iso=>"MT",:name=>"Malta")
Country.create(:id=>155,:iso=>"MU",:name=>"Mauritius")
Country.create(:id=>156,:iso=>"MV",:name=>"Maldives")
Country.create(:id=>157,:iso=>"MW",:name=>"Malawi")
Country.create(:id=>158,:iso=>"MX",:name=>"Mexico")
Country.create(:id=>159,:iso=>"MY",:name=>"Malaysia")
Country.create(:id=>160,:iso=>"MZ",:name=>"Mozambique")
Country.create(:id=>161,:iso=>"NA",:name=>"Namibia")
Country.create(:id=>162,:iso=>"NC",:name=>"New Caledonia")
Country.create(:id=>163,:iso=>"NE",:name=>"Niger")
Country.create(:id=>164,:iso=>"NF",:name=>"Norfolk Island")
Country.create(:id=>165,:iso=>"NG",:name=>"Nigeria")
Country.create(:id=>166,:iso=>"NI",:name=>"Nicaragua")
Country.create(:id=>167,:iso=>"NL",:name=>"Netherlands")
Country.create(:id=>168,:iso=>"NO",:name=>"Norway")
Country.create(:id=>169,:iso=>"NP",:name=>"Nepal")
Country.create(:id=>170,:iso=>"NR",:name=>"Nauru")
Country.create(:id=>171,:iso=>"NU",:name=>"Niue")
Country.create(:id=>172,:iso=>"NZ",:name=>"New Zealand")
Country.create(:id=>173,:iso=>"OM",:name=>"Oman")
Country.create(:id=>174,:iso=>"PA",:name=>"Panama")
Country.create(:id=>175,:iso=>"PE",:name=>"Peru")
Country.create(:id=>176,:iso=>"PF",:name=>"French Polynesia")
Country.create(:id=>177,:iso=>"PG",:name=>"Papua New Guinea")
Country.create(:id=>178,:iso=>"PH",:name=>"Philippines")
Country.create(:id=>179,:iso=>"PK",:name=>"Pakistan")
Country.create(:id=>180,:iso=>"PL",:name=>"Poland")
Country.create(:id=>181,:iso=>"PM",:name=>"Saint Pierre and Miquelon")
Country.create(:id=>182,:iso=>"PN",:name=>"Pitcairn")
Country.create(:id=>183,:iso=>"PR",:name=>"Puerto Rico")
Country.create(:id=>184,:iso=>"PS",:name=>"Palestinian Territory")
Country.create(:id=>185,:iso=>"PT",:name=>"Portugal")
Country.create(:id=>186,:iso=>"PW",:name=>"Palau")
Country.create(:id=>187,:iso=>"PY",:name=>"Paraguay")
Country.create(:id=>188,:iso=>"QA",:name=>"Qatar")
Country.create(:id=>189,:iso=>"RE",:name=>"Reunion")
Country.create(:id=>190,:iso=>"RO",:name=>"Romania")
Country.create(:id=>191,:iso=>"RS",:name=>"Serbia")
Country.create(:id=>192,:iso=>"RU",:name=>"Russia")
Country.create(:id=>193,:iso=>"RW",:name=>"Rwanda")
Country.create(:id=>194,:iso=>"SA",:name=>"Saudi Arabia")
Country.create(:id=>195,:iso=>"SB",:name=>"Solomon Islands")
Country.create(:id=>196,:iso=>"SC",:name=>"Seychelles")
Country.create(:id=>197,:iso=>"SD",:name=>"Sudan")
Country.create(:id=>198,:iso=>"SE",:name=>"Sweden")
Country.create(:id=>199,:iso=>"SG",:name=>"Singapore")
Country.create(:id=>200,:iso=>"SH",:name=>"Saint Helena")
Country.create(:id=>201,:iso=>"SI",:name=>"Slovenia")
Country.create(:id=>202,:iso=>"SJ",:name=>"Svalbard and Jan Mayen")
Country.create(:id=>203,:iso=>"SK",:name=>"Slovakia")
Country.create(:id=>204,:iso=>"SL",:name=>"Sierra Leone")
Country.create(:id=>205,:iso=>"SM",:name=>"San Marino")
Country.create(:id=>206,:iso=>"SN",:name=>"Senegal")
Country.create(:id=>207,:iso=>"SO",:name=>"Somalia")
Country.create(:id=>208,:iso=>"SR",:name=>"Suriname")
Country.create(:id=>209,:iso=>"ST",:name=>"Sao Tome and Principe")
Country.create(:id=>210,:iso=>"SV",:name=>"El Salvador")
Country.create(:id=>211,:iso=>"SX",:name=>"Sint Maarten")
Country.create(:id=>212,:iso=>"SY",:name=>"Syria")
Country.create(:id=>213,:iso=>"SZ",:name=>"Swaziland")
Country.create(:id=>214,:iso=>"TC",:name=>"Turks and Caicos Islands")
Country.create(:id=>215,:iso=>"TD",:name=>"Chad")
Country.create(:id=>216,:iso=>"TF",:name=>"French Southern Territories")
Country.create(:id=>217,:iso=>"TG",:name=>"Togo")
Country.create(:id=>218,:iso=>"TH",:name=>"Thailand")
Country.create(:id=>219,:iso=>"TJ",:name=>"Tajikistan")
Country.create(:id=>220,:iso=>"TK",:name=>"Tokelau")
Country.create(:id=>221,:iso=>"TL",:name=>"East Timor")
Country.create(:id=>222,:iso=>"TM",:name=>"Turkmenistan")
Country.create(:id=>223,:iso=>"TN",:name=>"Tunisia")
Country.create(:id=>224,:iso=>"TO",:name=>"Tonga")
Country.create(:id=>225,:iso=>"TR",:name=>"Turkey")
Country.create(:id=>226,:iso=>"TT",:name=>"Trinidad and Tobago")
Country.create(:id=>227,:iso=>"TV",:name=>"Tuvalu")
Country.create(:id=>228,:iso=>"TW",:name=>"Taiwan")
Country.create(:id=>229,:iso=>"TZ",:name=>"Tanzania")
Country.create(:id=>230,:iso=>"UA",:name=>"Ukraine")
Country.create(:id=>231,:iso=>"UG",:name=>"Uganda")
Country.create(:id=>232,:iso=>"UM",:name=>"United States Minor Outlying Islands")
Country.create(:id=>233,:iso=>"US",:name=>"United States")
Country.create(:id=>234,:iso=>"UY",:name=>"Uruguay")
Country.create(:id=>235,:iso=>"UZ",:name=>"Uzbekistan")
Country.create(:id=>236,:iso=>"VA",:name=>"Vatican")
Country.create(:id=>237,:iso=>"VC",:name=>"Saint Vincent and the Grenadines")
Country.create(:id=>238,:iso=>"VE",:name=>"Venezuela")
Country.create(:id=>239,:iso=>"VG",:name=>"British Virgin Islands")
Country.create(:id=>240,:iso=>"VI",:name=>"U.S. Virgin Islands")
Country.create(:id=>241,:iso=>"VN",:name=>"Vietnam")
Country.create(:id=>242,:iso=>"VU",:name=>"Vanuatu")
Country.create(:id=>243,:iso=>"WF",:name=>"Wallis and Futuna")
Country.create(:id=>244,:iso=>"WS",:name=>"Samoa")
Country.create(:id=>245,:iso=>"YE",:name=>"Yemen")
Country.create(:id=>246,:iso=>"YT",:name=>"Mayotte")
Country.create(:id=>247,:iso=>"ZA",:name=>"South Africa")
Country.create(:id=>248,:iso=>"ZM",:name=>"Zambia")
Country.create(:id=>249,:iso=>"ZW",:name=>"Zimbabwe")
Country.create(:id=>250,:iso=>"CS",:name=>"Serbia and Montenegro")
Country.create(:id=>251,:iso=>"AN",:name=>"Netherlands Antilles")
