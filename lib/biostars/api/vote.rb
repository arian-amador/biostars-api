module Biostars
	module API
		class Vote

			attr_reader :author, :author_id, :date, :id, :post_id, :type, :type_id

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v 
				end
			end

			def self.find(id)
				response = Biostars::API.getRequest("#{API_URL}/vote/#{id}")
				
				if response.success?
				 new JSON.parse response.body
				else
					raise Biostars::VoteError
				end
	  	end
		end
	end
end