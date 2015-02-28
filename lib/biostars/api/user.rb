module Biostars
	module API

		# General info about a user.
		# @author Arian Amador <arian@arianamador.com>
		class User
			
			# @return [String] the date the user joined the website, as the number of days ago
			attr_reader :date_joined 

      # @return [Fixnum] the identifier of the user
			attr_reader :id

			# @return [String] the date the user joined the website, ISO 8601 format
			attr_reader :joined_days_ago

			# @return [String] the date of the last login of the user, ISO 8601 format
			attr_reader :last_login

		  # @return [String] the name of the user.
			attr_reader :name

			# @return [Fixnum] the number of votes given by the user.
			attr_reader :vote_count

			def initialize(attributes)
				attributes.each do |k,v| 
					instance_variable_set "@#{k}", v unless v.nil?
				end
			end

			# Finds user with the given id.
			#
			# @param id [Fixnum] user id.
			# @return [User] returns User object.
			# @raise [Biostars::UserError] if User is not found.
			def self.find(id)
				attributes = Biostars::API.get "user/#{id}"
				attributes ? new(attributes) : raise(Biostars::UserError)
			end
		end
	end
end