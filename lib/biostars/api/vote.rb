module Biostars
	module API
		class Vote

			attr_reader :author, :author_id, :date, :id, :post_id, :type, :type_id

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			def self.find(id)
				Biostars::API.get("vote/#{id}", self, Biostars::VoteError)
	  	end
		end
	end
end