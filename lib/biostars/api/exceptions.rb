module Biostars
	# Generic Error
	class Error < StandardError; end

	# Raised on User Errors
	class UserError < Error; end

	# Raised on Post Errors
	class PostError < Error; end

	# Raised on Vote Errors
	class VoteError < Error; end

	# Raised on Stats Errors
	class StatsError < Error; end

end