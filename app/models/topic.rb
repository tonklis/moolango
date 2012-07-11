class Topic < ActiveRecord::Base

	def self.get_topic_details(topic_id)

		result = {}

		case topic_id
			when 1
				result[:small_id] = '13599504' 
				result[:big_id] = '120710173823'
				result[:name] = 'lost'
				result[:name_cap] = 'Lost'
				result[:name_hyp] = 'lost'
				result[:id] = '01'
			when 7
				result[:small_id] = '13599590' 
				result[:big_id] = '120710175342'
				result[:name] = 'stevejobs'
				result[:name_cap] = 'Steve jobs'
				result[:name_hyp] = 'steve-jobs'
				result[:id] = '01'
			when 2
				result[:small_id] = '13599487'
				result[:big_id] = '120710173637'
				result[:name] = 'darkknight'
				result[:name_cap] = 'Dark knight'
				result[:name_hyp] = 'dark-knight'
				result[:id] = '01'
			when 4
				result[:small_id] = '13599490' 
				result[:big_id] = '120710173703'
				result[:name] = 'up'
				result[:name_cap] = 'Up'
				result[:name_hyp] = 'up'
				result[:id] = '01'
			when 5
				result[:small_id] = '13599508' 
				result[:big_id] = '120710173830'
				result[:name] = 'mariokart'
				result[:name_cap] = "Mario kart"
				result[:name_hyp] = 'mario-kart'
				result[:id] = '02'
			when 6
				result[:small_id] = '13599496' 
				result[:big_id] = '120710173744'
				result[:name] = 'gameofthrones'
				result[:name_cap] = 'Game ofthrones'
				result[:name_hyp] = 'game-ofthrones'
				result[:id] = '02'
			when 9
				result[:small_id] = '13599489'
				result[:big_id] = '120710173645'
				result[:name] = 'harrypotter'
				result[:name_cap] = 'Harry potter'
				result[:name_hyp] = 'harry-potter'
				result[:id] = '01'
			when 8
				result[:small_id] = '13599483'
				result[:big_id] = '120710173627'
				result[:name] = 'simpsons'
				result[:name_cap] = 'Simpsons'
				result[:name_hyp] = 'simpsons'
				result[:id] = '02'
			when 3
				result[:small_id] = '13599509' 
				result[:big_id] = '120710173843'
				result[:name] = 'avatar'
				result[:name_cap] = 'Avatar'
				result[:name_hyp] = 'avatar'
				result[:id] = '02'
		end	
		return result
	end

end
