module Biostars
	module API
		class User

			attr_reader :id, :name, :last_login, :joined_days_ago, :vote_count, :date_joined

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			def self.find(id)
				Biostars::API.get("user/#{id}", self, Biostars::UserError)
			end
		end
	end
end