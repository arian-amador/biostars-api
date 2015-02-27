require './test/minitest_helper'

class TestBiostarsUser < Minitest::Test
	context 'User' do
		should 'raise UserError on invalid user' do
			VCR.use_cassette('user_error') do
				assert_raises(Biostars::UserError) { Biostars::API::User.find 0 }
			end
		end

		should 'return a user object' do
			VCR.use_cassette('user_data') do
				user = Biostars::API::User.find(23)

				assert_equal 23, user.id
				assert_equal 1865, user.joined_days_ago
				assert_equal "2015-02-26T18:08:55.381583+00:00", user.last_login
				assert_equal "Giovanni M Dall'Olio", user.name
				assert_equal 3703, user.vote_count
			end
		end
	end
end
