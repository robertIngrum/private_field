require 'private_field/version'

module PrivateField
  require 'private_field/privatizer'

  def self.included(base)
    base.extend PrivateField::Privatizer
  end
end

