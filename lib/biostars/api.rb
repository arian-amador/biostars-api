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

    # Used for API requests
  	API_URL = 'https://www.biostars.org/api'

    # Number of post views over the last 60 min filtered by unique IPs.
    #
    # @return [Traffic] returns a Traffic object.
    # @raise [Biostars::Error] if API is not responding
  	def self.traffic
  		Biostars::API.get("traffic", Biostars::API::Traffic, Biostars::Error)
  	end

  	private
      # Used for general GET http requests to the API
      #
      # @param url [String] API request endpoint.
      # @param klass [String] class to instantiate with a valid response.
      # @param klass_error [Error] class error to raise if there are issues with the API request.
      # @return [Hash] returns API response
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