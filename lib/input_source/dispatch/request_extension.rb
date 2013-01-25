module InputSource
  module Dispatch
    module RequestExtension
      include ConverseParameters
      
      private

      def normalize_parameters(value)
        converse_parameters(super)
      end
    end
  end
end