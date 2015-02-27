module Biostars
	module API
		class Vote

			attr_reader :author, :author_id, :date, :id, :post_id, :type, :type_id

			def initialize(attributes)
				raise Biostars::VoteError if attributes.empty? || attributes.nil?

				attributes.each { |k,v| instance_variable_set "@#{k}", v }
			end

			def self.find(id)
	  		response = HTTParty.get "#{API_URL}/vote/#{id}"
	  		new JSON.parse response.body
	  	end
		end
	end
end