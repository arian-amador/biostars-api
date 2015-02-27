require 'httparty'
require 'json'

__LIB_DIR__ = File.expand_path(File.join(File.dirname(__FILE__), ".."))
unless $LOAD_PATH.include?(__LIB_DIR__)
  $LOAD_PATH.unshift(__LIB_DIR__)
end

require_relative "api/exceptions"
require_relative "api/version"
require_relative "api/traffic"
require_relative "api/stats"
require_relative "api/user"
require_relative "api/post"
require_relative "api/vote"

module Biostars
  module API
  	API_URL = 'https://www.biostars.org/api'
  end
end