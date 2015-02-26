require './test/minitest_helper'

class TestBiostars < Minitest::Test
	context 'Biostars' do

		should 'exist' do
			assert Biostars::API
		end

		should 'have a valid version number' do
			refute_nil Biostars::API::VERSION
		end

		describe 'Traffic class' do
			should 'hava a traffic method' do
				assert_respond_to Biostars::API, 'traffic'
			end
		end

		describe 'User class' do
			should 'raise UserError on invalid user' do
				VCR.use_cassette('user_error') do
					assert_raises(Biostars::UserError) { Biostars::API.user(0) }
				end
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
		end

		describe 'Post class' do
			should 'raise PostError on invalid post' do
				VCR.use_cassette('post_error') do
					assert_raises(Biostars::PostError) { Biostars::API.post(0) }
				end
			end

			should 'return a post' do
				VCR.use_cassette('post_data') do
					post = Biostars::API.post(25)
					assert_equal Biostars::API::Post, post.class

					assert_equal 25, post.id
					assert_equal 18, post.author_id
					assert_equal 2,  post.answer_count
					assert_equal 24, post.root_id
					assert_equal 1,  post.type_id
					assert_equal "A: How To Set Shrimp Parameters For Best Sensitivity With 35Bp Colorspace Data?", post.title
					assert_equal "Answer", post.type
				end
			end
		end
	end

end
