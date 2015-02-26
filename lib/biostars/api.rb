__LIB_DIR__ = File.expand_path(File.join(File.dirname(__FILE__), ".."))
unless $LOAD_PATH.include?(__LIB_DIR__)
  $LOAD_PATH.unshift(__LIB_DIR__)
end

require "biostars/api/version"

#TODO: Require other objects here...

module Biostars
  class API
  	# TODO: Code here
  end
end