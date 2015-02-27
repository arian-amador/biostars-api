module Biostars
	module API
		class User

			attr_reader :id, :name, :last_login, :joined_days_ago, :vote_count, :date_joined

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v 
				end
			end

			def self.find(id)
	 			response = Biostars::API.getRequest "#{API_URL}/user/#{id}"

				if response.success?
				 new JSON.parse response.body
				else
					raise Biostars::UserError
				end
			end
		end
	end
end