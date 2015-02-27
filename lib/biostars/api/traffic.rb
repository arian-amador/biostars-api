module Biostars
	module API
  	class Traffic

  		attr_reader :date, :post_views_last_60_min, :timestamp

  		def initialize
  			response = HTTParty.get "#{API_URL}/traffic"
  			attributes = JSON.parse response.body
				attributes.each { |k,v| instance_variable_set "@#{k}", v }
  		end

  	end
	end
end
