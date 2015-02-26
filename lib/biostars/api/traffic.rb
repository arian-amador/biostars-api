module Biostars
	module API
  	class Traffic

  		attr_reader :date, :post_views_last_60_min, :timestamp

  		def initialize(attributes)
				@date = attributes['date']
				@post_views_last_60_min = attributes['post_views_last_60_min']
				@timestamp = attributes['timestamp']
  		end
  	end
	end
end
