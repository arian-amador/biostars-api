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

			def self.find_by_day(day=Date.today.day)
				raise Biostars::StatsError, "Expecting a Date Object" unless day.is_a? Fixnum

				Biostars::API.find("stats/day/#{day}", self, Biostars::StatsError)
			end

			def self.find_by_date(date=Date.today-1)
				raise Biostars::StatsError unless date.is_a? Date

				url = "stats/date/%s/%s/%s" % [
					date.year,
					sprintf('%02d', date.month),
					sprintf('%02d', date.day),
				]

				Biostars::API.find(url, self, Biostars::StatsError)
			end
		end
	end
end