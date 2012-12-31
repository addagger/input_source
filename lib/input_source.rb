require "input_source/version"

module InputSource
  def self.load!
		require 'input_source/engine'
		require 'input_source/railtie'
	end
end

InputSource.load!
