require 'private_field'

module PrivateField
  module Privatizer
    def private_field(name, options = {})
      field              name, options
      override_accessors name
    end

    def readable_field(name, options = {})
      field            name, options
      override_writers name
    end

    private

    def override_accessors(name)
      override_readers name
      override_writers name
    end

    def override_readers(name)
      private :"#{name}"
      private :"#{name}_before_type_cast"
      private :"#{name}?"
    end

    def override_writers(name)
      private :"#{name}="
    end
  end
end

module Mongoid::Attributes::Processing
  private

  def process_attribute(name, value)
    method_name = "#{name_alias(name) || name}="

    return send(method_name, value)                          if respond_to? method_name
    return Errors::PrivateField.new(self.class, method_name) if respond_to? method_name, true

    raise Errors::UnknownAttribute.new(self.class, name)
  end

  def name_alias(name)
    aliased_fields.invert[name.to_s]
  end
end
