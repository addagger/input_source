module InputSource
	module Dispatch
		module ConverseParameters
			# Converse parameters

			def converse_parameters(value, prefix = nil, parent = nil)
				case value
			  when Hash
			    value.each do |k, v|
						new_prefix = prefix ? "#{prefix}[#{k}]" : k
						converse_parameters(v, new_prefix, value)
					end
			  when Array
			    value.each do |e|
						new_prefix = "#{prefix}[]"
						converse_parameters(e, new_prefix, value)
					end
			  else
			    value
			  end
				value.tap do |v|
					v.singleton_class.send(:undef_method, :belongs_to) if v.respond_to?(:belongs_to)
					v.define_singleton_method :belongs_to do
						parent
					end
					v.singleton_class.send(:undef_method, :input_source) if v.respond_to?(:input_source)
					v.define_singleton_method :input_source do
						prefix.to_s
					end
				end
			end
			
			# private
			# 
			# def normalize_parameters(value)
			# 	converse_parameters(super)
			# 		  end

		end
	end
end