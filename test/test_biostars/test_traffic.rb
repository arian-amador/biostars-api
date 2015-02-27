require './test/minitest_helper'

class TestBiostarsTraffic < Minitest::Test
	context 'Traffic' do
		should 'return traffic data' do
			VCR.use_cassette('traffic_data') do
				traffic = Biostars::API::Traffic.new

				assert_equal '2015-02-26T14:52:43.353835', traffic.date
				assert_equal 917, traffic.post_views_last_60_min
				assert_equal 1424962363, traffic.timestamp
			end
		end
	end
end
