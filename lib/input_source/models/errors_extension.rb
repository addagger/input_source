module InputSource
  module ErrorsExtension
    extend ActiveSupport::Concern

    included do
      delegate :field_of, :to => :@base
    end

    def fields
      keys.map {|attribute| field_of(attribute)}.compact.tap do |names|
        names.instance_eval do
          def ids
            self.map(&:to_id)
          end
        end
      end
    end
  end
end