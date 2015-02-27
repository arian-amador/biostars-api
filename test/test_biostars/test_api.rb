require './test/minitest_helper'

class TestBiostars < Minitest::Test
	context 'Biostars API' do
		should 'exist' do
			assert Biostars::API
		end

		should 'have a valid version number' do
			refute_nil Biostars::API::VERSION
		end
	end
end
