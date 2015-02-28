module Biostars
	module API

    # Number of post views over the last 60 min filtered by unique IPs.
    # @author Arian Amador <arian@arianamador.com>
  	class Traffic

      # @return [String] the current date, ISO 8601 format.
  		attr_reader :date
      
      # @return [Fixnum] number of post views over the last 60 min filtered by unique IPs.
      attr_reader :post_views_last_60_min

      # @return [Fixnum] current date unix epoch time format.
      attr_reader :timestamp

  		def initialize(attributes)
        attributes.each do |k,v| 
          instance_variable_set "@#{k}", v unless v.nil?
        end
  		end
  	end
	end
end