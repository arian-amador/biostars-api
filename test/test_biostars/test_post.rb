require './test/minitest_helper'

class TestBiostarsPost < Minitest::Test
	context 'Post' do
		should 'raise PostError on invalid post' do
			VCR.use_cassette('post_error') do
				assert_raises(Biostars::PostError) { Biostars::API::Post.find 0 }
			end
		end

		should 'return a post' do
			VCR.use_cassette('post_data') do
				post = Biostars::API::Post.find 25

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