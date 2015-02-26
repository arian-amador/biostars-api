# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path("#{File.dirname(__FILE__)}/../lib/biostars/api")

require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda/context'

require 'webmock/minitest'
require 'vcr'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end