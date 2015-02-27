require './test/minitest_helper'

class TestBiostarsVote < Minitest::Test
	context 'Vote' do
		should 'raise VoteError on invalid vote' do
			VCR.use_cassette('vote_error') do
				assert_raises(Biostars::VoteError) { Biostars::API::Vote.find 0 }
			end
		end

		should 'return a vote' do
			VCR.use_cassette('vote_data') do
				vote = Biostars::API::Vote.find 21

				assert_equal 21, vote.id
				assert_equal 14, vote.author_id
				assert_equal 26, vote.post_id
				assert_equal 0,  vote.type_id
				assert_equal 'Upvote', vote.type
			end
		end			
	end
end
