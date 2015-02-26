module Biostars
	module API
		class User

			attr_reader :id, :name, :last_login, :joined_days_ago, :vote_count

			def initialize(attributes)
				raise Biostars::UserError if attributes.empty? || attributes.nil?

				@id = attributes["id"]
				@name = attributes["name"]
				@last_login = attributes["last_login"]
				@joined_days_ago = attributes["joined_days_ago"]
				@vote_count = attributes["vote_count"]
			end
		end
	end
end