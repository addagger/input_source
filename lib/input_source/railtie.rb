require 'rails'

module InputSource
  class Railtie < ::Rails::Railtie
    config.before_initialize do
      ActiveSupport.on_load :active_record do
        require 'input_source/models/active_record_extension'

        # For Rails > 3.2.9: ActiveRecord::AttributeAssignment
        # For Rails < 3.2.9: ActiveRecord::Base
        include ActiveRecordExtension
      end
      ActiveSupport.on_load :action_controller do
        require 'input_source/dispatch/converse_parameters'
        require 'input_source/dispatch/request_extension'
        require 'input_source/dispatch/controller_extension'
        ActionDispatch::Request.send(:include, Dispatch::RequestExtension)
        include Dispatch::ControllerExtension
      end
    end

  end
end