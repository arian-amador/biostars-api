require './test/minitest_helper'

class TestBiostarsTraffic < Minitest::Test
	context 'Traffic' do
		should 'return traffic data' do
			VCR.use_cassette('traffic_data') do
				traffic = Biostars::API::Traffic.new

				assert_equal '2015-02-26T21:23:49.665902', traffic.date
				assert_equal 651, traffic.post_views_last_60_min
				assert_equal 1424985829, traffic.timestamp
			end
		end
	end
end
