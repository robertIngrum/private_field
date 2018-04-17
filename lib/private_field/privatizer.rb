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
