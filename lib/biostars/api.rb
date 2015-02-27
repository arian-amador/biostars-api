$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../api', __FILE__)

require 'httparty'
require 'json'

require "api/exceptions"
require "api/version"
require "api/traffic"
require "api/stats"
require "api/user"
require "api/post"
require "api/vote"

module Biostars
  module API
  	API_URL = 'https://www.biostars.org/api'

  	def self.traffic
  		Biostars::API.get("traffic", Biostars::API::Traffic, Biostars::Error)
  	end

  	private
  		def self.get(url, klass, klass_error)
  			response = HTTParty.get "#{API_URL}/#{url}"

				if response.success?
				  Object::const_get(klass.to_s).new(JSON.parse response.body)
				else
					raise klass_error
				end
  		end
  end
end