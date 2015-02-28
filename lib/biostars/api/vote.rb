module Biostars
	module API

		# General info about a vote.
		# @author Arian Amador <arian@arianamador.com>
		class Vote

			# @return [String] author name.
			attr_reader :author

			# @return [Fixnum] author's identifier, a number.
			attr_reader :author_id

			# @return [String] date of the vote, ISO 8601 format.
			attr_reader :date

			# @return [Fixnum] identifier of the vote, a number.
			attr_reader :id

			# @return [Fixnum] identifier of the voted post.
			attr_reader :post_id

			# @return [String] type of vote.
			attr_reader :type

			# @return [Fixnum] type's identifier for this vote.
			attr_reader :type_id

			# Instantiate the Biostars::API::Vote.
			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			# Finds vote with the given id.
			#
			# @param id [Fixnum] vote id.
			# @return [Vote] returns Vote object.
			# @raise [Biostars::VoteError] if the Vote is not found.
			def self.find(id)
				attributes = Biostars::API.get "vote/#{id}" 
				attributes ? new(attributes) : raise(Biostars::VoteError)
	  	end
		end
	end
end