require './test/minitest_helper'

class TestBiostarsTraffic < Minitest::Test
	context 'Traffic' do
		should 'return traffic data' do
			VCR.use_cassette('traffic_data') do
				traffic = Biostars::API.traffic

				assert_equal '2015-02-27T16:13:01.804622', traffic.date
				assert_equal 811, traffic.post_views_last_60_min
				assert_equal 1425053581, traffic.timestamp
			end
		end
	end
end