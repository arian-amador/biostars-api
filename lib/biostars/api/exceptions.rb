module Biostars
	class Error < StandardError; end
	class UserError < Error; end
	class PostError < Error; end
	class VoteError < Error; end
	class StatsError < Error; end
end