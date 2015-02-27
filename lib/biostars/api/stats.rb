module Biostars
	module API
		class Stats

			attr_reader :answers, :comments, :date, :new_posts, :new_users, :new_votes,
				:questions, :timestamp, :toplevel, :users, :votes

			def initialize(attributes)
				raise Biostars::StatsError if attributes.empty? || attributes.nil?

				attributes.each { |k,v| instance_variable_set "@#{k}", v }
			end

			def self.find_by_day(day=Date.today.day)
				response = getRequest "stats/day/#{day}"
				new JSON.parse response.body
			end

			def self.find_by_date(date=Date.today)

				url = "stats/date/%s/%s/%s" % [
					date.year,
					sprintf('%02d', date.month),
					sprintf('%02d', date.day),
				]

				response = getRequest url
				new JSON.parse response.body
			end

			private
				def self.getRequest(endpoint)
					HTTParty.get "#{API_URL}/#{endpoint}"
				end
		end
	end
end