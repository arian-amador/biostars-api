module Biostars
	module API
		class Stats

			attr_reader :answers, :comments, :date, :new_posts, :new_users, :new_votes,
				:questions, :timestamp, :toplevel, :users, :votes

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			def all_posts
				new_posts.collect do |post_id|
					Biostars::API::Post.find post_id
				end
			end

			def all_votes
				new_votes.collect do |vote_id|
					Biostars::API::Vote.find vote_id
				end
			end

			def all_users
				new_users.collect do |user_id|
					Biostars::API::User.find user_id
				end
			end

			class << self
				def latest
					find_by_date
				end

				def find_by_day(day=Date.today.day)
					raise Biostars::StatsError, "Expecting a Date Object" unless day.is_a? Fixnum

					Biostars::API.get("stats/day/#{day}", self, Biostars::StatsError)
				end

				def find_by_date(date=Date.today-1)
					raise Biostars::StatsError unless date.is_a? Date

					url = "stats/date/%s/%s/%s" % [
						date.year,
						sprintf('%02d', date.month),
						sprintf('%02d', date.day),
					]

					Biostars::API.get(url, self, Biostars::StatsError)
				end
			end
		end
	end
end