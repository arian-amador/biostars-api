module Biostars
	module API
  	class Traffic

  		attr_reader :date, :post_views_last_60_min, :timestamp

  		def initialize(attributes)
        attributes.each do |k,v|
          instance_variable_set "@#{k}", v unless v.nil?
        end
  		end
  	end
	end
end