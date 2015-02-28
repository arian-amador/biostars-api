module Biostars
	module API
		class Stats

      # @return [Fixnum] total number of answers as of the given day/date.
			attr_reader :answers

			# @return [Fixnum] total number of comments as of the given day/date .
			attr_reader :comments

			# @return [String] the current date, ISO 8601 format
			attr_reader :date

			# @return [Array] number of new posts in the given day/date .
			attr_reader :new_posts

			# @return [Array] number of new users in the given day/date .
			attr_reader :new_users

			# @return [Array] number of new votes in the given day/date .
			attr_reader :new_votes

			# @return [Fixnum] total number of questions as of the given day/date.
			attr_reader :questions

			# @return [Fixnum] date, unix epoch time format.
			attr_reader :timestamp

			# @return [Fixnum]  total number of toplevel post as of the given day/date.
			attr_reader :toplevel

			# @return [Fixnum] total number of users as of the given day/date.
			attr_reader :users

      # @return [Fixnum] total number of votes as of the given day/date.
			attr_reader :votes

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			# Returns an Array of Post objects for all Posts on the given day/date.
			#
			# @return [Array] of Post objects.
			def all_posts
				new_posts.collect do |post_id|
					Biostars::API::Post.find post_id
				end
			end

			# Returns an Array of Vote objects for all Votes on the given day/date.
			#
			# @return [Array] of Vote objects.
			def all_votes
				new_votes.collect do |vote_id|
					Biostars::API::Vote.find vote_id
				end
			end

			# Returns an Array of User objects for all Users on the given day/date.
			#
			# @return [Array] of User objects.
			def all_users
				new_users.collect do |user_id|
					Biostars::API::User.find user_id
				end
			end

			class << self

				# Helper method to look up stats for the prior date.
				#
				# @return [Stats] returns a Stats object.
				def latest
					find_by_date
				end

				# Statistics as of the Nth day after day-0 (the day of the first ever post).
				#
				# @param day [Date] number of days after day-0, a number.
				# @return [Stats] returns a Stats object.
				# @raise [Biostars::StatsError] if the day passed is not a valid Fixnum.
				def find_by_day(day=Date.today.day)
					raise Biostars::StatsError, "Expecting a Date Object" unless day.is_a? Fixnum

					Biostars::API.get("stats/day/#{day}", self, Biostars::StatsError)
				end

				# Statistics as of the given date.
				#
				# @param date [Date] Date object for specific date.
				# @return [Stats] returns a Stats object.
				# @raise [Biostars::StatsError] if the date passed is not a valid Date.
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