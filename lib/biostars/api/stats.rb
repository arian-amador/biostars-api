module Biostars
	module API
		class Stats

			attr_reader :answers, :comments, :date, :new_posts, :new_users, :new_votes,
				:questions, :timestamp, :toplevel, :users, :votes

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v 
				end
			end

			def self.find(url)
	 			response = Biostars::API.getRequest url

				if response.success?
				 new JSON.parse response.body
				else
					raise Biostars::StatsError
				end
			end

			def self.find_by_day(day=Date.today.day)
				raise Biostars::StatsError unless day.is_a? Fixnum

				self.find "#{API_URL}/stats/day/#{day}"
			end

			def self.find_by_date(date=Date.today)
				raise Biostars::StatsError unless date.is_a? Date

				self.find "%s/stats/date/%s/%s/%s" % [
					API_URL,
					date.year,
					sprintf('%02d', date.month),
					sprintf('%02d', date.day),
				]
			end
		end
	end
end