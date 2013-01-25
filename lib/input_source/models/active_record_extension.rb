require 'input_source/models/errors_extension'

module InputSource
  ActiveModel::Errors.send(:include, ErrorsExtension)
  
  module ActiveRecordExtension
    extend ActiveSupport::Concern
  
    module ClassMethods
    end

    def assign_attributes(*args)
      new_attributes = args.first
      if new_attributes.respond_to?(:input_source)
        @input_source = new_attributes.input_source
      end
      super(*args)
    end

    def field_of(attribute)
      if @input_source && has_attribute?(attribute)
        "#{@input_source}[#{attribute}]".tap do |input_source|
          input_source.instance_eval do
            def to_id
              self.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
            end
          end
        end
      end
    end
    
  end
end