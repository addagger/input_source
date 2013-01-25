require "input_source/version"

module InputSource
  def self.load!
    require 'input_source/engine'
    require 'input_source/railtie'

    warn <<-EOW

    DEPRECATION WARNING: Gem 'input_source' has been moved into 'active_tools' gem.
    Further development of 'input_source' will no longer continue.

    Thank you!

EOW

  end
end

InputSource.load!
