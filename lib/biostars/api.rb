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

# API wrapper for https://www.biostars.org public API
# @see https://www.biostars.org/info/api/
# @author Arian Amador <arian@arianamador.com>
module Biostars

  # API wrapper for https://www.biostars.org public API
  # @see https://www.biostars.org/info/api/
  # @author Arian Amador <arian@arianamador.com>
  module API

    # Used for API requests
  	API_URL = 'https://www.biostars.org/api'

    # Number of post views over the last 60 min filtered by unique IPs.
    #
    # @return [Traffic] returns a Traffic object.
    # @raise [Biostars::Error] if API is not responding
  	def self.traffic
  		attributes = Biostars::API.get "traffic"
      attributes ? Biostars::API::Traffic.new(attributes) : raise(Biostars::Error)
  	end

    # Used for general GET http requests to the API
    #
    # @param url [String] API request endpoint.
    # @return [Hash] returns API response
    def self.get(url)
      response = HTTParty.get "#{API_URL}/#{url}"
      response.success? ? JSON.parse(response.body) : false
    end
  end
end