require './test/minitest_helper'

class TestBiostarsStats < Minitest::Test
	context 'Stats' do
		describe 'Stats class' do

			should 'raise StatsError on invalid requests' do
				assert_raises(Biostars::StatsError) { Biostars::API::Stats.find_by_day 'a'}
				assert_raises(Biostars::StatsError) { Biostars::API::Stats.find_by_date 'asdf' }
			end

			should 'raise StatsError with future dates' do
				VCR.use_cassette('stats_future_date_error') do
					assert_raises(Biostars::StatsError) { Biostars::API::Stats.find_by_date Date.new(2020,01,01)}
				end
			end

			should 'raise StatsError with todays date' do
				VCR.use_cassette('stats_todays_date_error') do
					assert_raises(Biostars::StatsError) { Biostars::API::Stats.find_by_date Date.today }
				end
			end

			should 'return stats object from day-0 to specified day' do
				VCR.use_cassette('stats_find_by_day') do
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
				VCR.use_cassette('stats_find_by_date') do
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

			should 'return stats object even with pre internet dates' do
				VCR.use_cassette('stats_find_by_date_far_past') do
					stats = Biostars::API::Stats.find_by_date Date.new(1982,11,01)

					assert_equal 0, stats.answers
					assert_equal 0, stats.comments
					assert_equal "1982-11-01T00:00:00", stats.date
					assert_equal [], stats.new_posts
					assert_equal 0, stats.new_posts.count
					assert_equal [], stats.new_users
					assert_equal 0, stats.new_users.count
					assert_equal [], stats.new_votes
					assert_equal 0, stats.new_votes.count
					assert_equal 0, stats.questions
					assert_equal 0, stats.users
					assert_equal 0, stats.votes
				end
			end
						
			# FWIW: This also tests method Biostars::API::Stats.latest
			should 'default to yesterdays date and return a stats object' do
				stats = Biostars::API::Stats.find_by_date
				yesterday_iso8601 = DateTime.iso8601((Date.today - 1).to_s).to_s

				assert_equal yesterday_iso8601.split('+')[0], stats.date
				assert stats.answers
				assert stats.comments
				assert stats.votes
			end

			should 'return an Array of Users for specific date' do
				VCR.use_cassette('stats_all_users') do
					stats = Biostars::API::Stats.find_by_date Date.new(2014,12,30)
					users = stats.all_users
					
					assert_kind_of Array, users
					assert_equal users.first.id, 15484
					assert_equal users.first.name, "quangmaiv"
					assert_equal users.last.id, 15494
					assert_equal users.last.name, "Bohdan Khomtchouk"
				end
			end

			should 'return an Array of Posts for specific date' do
				VCR.use_cassette('stats_all_posts') do
					stats = Biostars::API::Stats.find_by_date Date.new(2014,12,30)
					posts = stats.all_posts
					
					assert_kind_of Array, posts
					assert_equal posts.first.id, 125221
					assert_equal posts.first.title, "C: Why there is huge difference in mapping quality with bwa & bowtie "
					assert_equal posts.last.id, 125334
					assert_equal posts.last.title, "HeatmapGenerator: High performance RNAseq and microarray visualization software suite to examine differential gene expression levels using an R and C++ hybrid computational pipeline"
				end
			end

			should 'return an Array of Votes for specific date' do
				VCR.use_cassette('stats_all_votes') do
					stats = Biostars::API::Stats.find_by_date Date.new(2014,12,30)
					votes = stats.all_votes
					
					assert_kind_of Array, votes
					assert_equal votes.first.id, 143453
					assert_equal votes.first.author, "marina.v.yurieva"
					assert_equal votes.last.id, 143534
					assert_equal votes.last.author, "Siva"
				end
			end			
		end
	end
end