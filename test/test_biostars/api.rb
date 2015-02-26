require './test/minitest_helper'

class TestBiostars < Minitest::Test
	context 'Biostars' do
		should 'exist' do
			assert Biostars::API
		end

		should 'have a valid version number' do
			refute_nil Biostars::Api::VERSION
		end
	end
end
