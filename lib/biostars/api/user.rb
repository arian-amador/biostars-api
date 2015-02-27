module Biostars
	module API
		class User

			attr_reader :id, :name, :last_login, :joined_days_ago, :vote_count, :date_joined

			def initialize(attributes)
				raise Biostars::UserError if attributes.empty? || attributes.nil?

				attributes.each { |k,v| instance_variable_set "@#{k}", v }
			end

			def self.find(id)
				response = HTTParty.get "#{API_URL}/user/#{id}"
				new JSON.parse response.body
			end
		end
	end
end