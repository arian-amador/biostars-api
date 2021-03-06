require './test/minitest_helper'

class TestBiostarsTraffic < Minitest::Test
	context 'Traffic' do
		should 'return traffic data' do
			VCR.use_cassette('traffic_find') do
				traffic = Biostars::API.traffic

				assert_equal '2015-02-27T22:01:00.683939', traffic.date
				assert_equal 369, traffic.post_views_last_60_min
				assert_equal 1425074460, traffic.timestamp
			end
		end
	end
end