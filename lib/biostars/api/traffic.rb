module Biostars
	module API
  	class Traffic

  		attr_reader :date, :post_views_last_60_min, :timestamp

  		def initialize
        response = Biostars::API.getRequest "#{API_URL}/traffic"

        if response.success?
          JSON.parse(response.body).each do |k,v|
            instance_variable_set "@#{k}", v
          end
        else
          raise Biostars::Error
        end
  		end
  	end
	end
end
