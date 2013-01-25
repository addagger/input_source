module InputSource
  module Dispatch
    module ControllerExtension
      def converse(hash, key)
        converse_parameters(hash[key], key)
      end

      private

      include ConverseParameters
    end
  end
  
end