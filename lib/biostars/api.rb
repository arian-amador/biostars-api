require 'httparty'
require 'json'

__LIB_DIR__ = File.expand_path(File.join(File.dirname(__FILE__), ".."))
unless $LOAD_PATH.include?(__LIB_DIR__)
  $LOAD_PATH.unshift(__LIB_DIR__)
end

require_relative "api/exceptions"
require_relative "api/version"
require_relative "api/traffic"
require_relative "api/user"

module Biostars
  module API
  	API_URL = 'https://www.biostars.org/api'

  	def self.traffic
  		response = request 'traffic'
			Traffic.new JSON.parse(response.body)
  	end

  	def self.user(id)
  		response = request "user/#{id}"
			User.new JSON.parse(response.body)
  	end

  	private

  		def self.request(endpoint)
  			HTTParty.get("#{API_URL}/#{endpoint}")
  		end
  end
end