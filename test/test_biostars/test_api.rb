require './test/minitest_helper'

class TestBiostars < Minitest::Test
	context 'Biostars' do
		should 'have an API class' do
			assert Biostars::API
		end

		should 'have a valid version number' do
			refute_nil Biostars::API::VERSION
		end

		should 'hava a traffic method' do
			assert_respond_to Biostars::API, 'traffic'
		end

		should 'return traffic data' do
			VCR.use_cassette('traffic_data') do
				traffic = Biostars::API.traffic
				assert_equal Biostars::API::Traffic, traffic.class

				assert_equal '2015-02-26T14:52:43.353835', traffic.date
				assert_equal 917, traffic.post_views_last_60_min
				assert_equal 1424962363, traffic.timestamp
			end
		end

		should 'return a user' do
			VCR.use_cassette('user_data') do
				user = Biostars::API.user(23)
				assert_equal Biostars::API::User, user.class

				assert_equal 23, user.id
				assert_equal 1865, user.joined_days_ago
				assert_equal "2015-02-26T18:08:55.381583+00:00", user.last_login
				assert_equal "Giovanni M Dall'Olio", user.name
				assert_equal 3703, user.vote_count
			end
		end

		should 'raise UserError on invalid user' do
			VCR.use_cassette('user_error') do
				assert_raises(Biostars::UserError) { Biostars::API.user(0) }
			end
		end
	end

end
