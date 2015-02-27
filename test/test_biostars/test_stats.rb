require './test/minitest_helper'

class TestBiostarsStats < Minitest::Test
	context 'Stats' do
		describe 'Stats class' do

			should 'raise StatsError on invalid stats' do
				VCR.use_cassette('stats_day_error') do
					assert_raises(Biostars::StatsError) { Biostars::API::Stats.find_by_day 1000000 }
				end
			end

			should 'return stats object from day-0 to specified day' do
				VCR.use_cassette('stats_day') do
					stats = Biostars::API::Stats.find_by_day 5

					assert_equal 6, stats.answers
					assert_equal 2, stats.comments
					assert_equal "2009-10-05T00:00:00", stats.date
					assert_equal [10,11,12], stats.new_posts
					assert_equal 3, stats.new_posts.count
					assert_equal [10,11], stats.new_users
					assert_equal 2, stats.new_users.count
					assert_equal [], stats.new_votes
					assert_equal 0, stats.new_votes.count
					assert_equal 6, stats.questions
					assert_equal 10, stats.users
					assert_equal 0, stats.votes
				end
			end
			should 'return stats object for a specific date' do
				VCR.use_cassette('stats_date') do
					stats = Biostars::API::Stats.find_by_date Date.new(2009,10,06)

					assert_equal 9, stats.answers
					assert_equal 2, stats.comments
					assert_equal "2009-10-06T00:00:00", stats.date
					assert_equal [13,14,15,16], stats.new_posts
					assert_equal 4, stats.new_posts.count
					assert_equal [12,13], stats.new_users
					assert_equal 2, stats.new_users.count
					assert_equal [], stats.new_votes
					assert_equal 0, stats.new_votes.count
					assert_equal 7, stats.questions
					assert_equal 12, stats.users
					assert_equal 0, stats.votes
				end
			end			
		end
	end
end
