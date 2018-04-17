require File.expand_path("#{File.dirname(__FILE__)}/spec_helper")
require 'mongoid'

describe PrivateField do
  class TestModel
    include Mongoid::Document
    include PrivateField

    field          :public_field,   type: Boolean
    private_field  :private_field,  type: Boolean
    readable_field :readable_field, type: Boolean

    def test_readability(field_name)
      method(field_name).call
    end

    def test_writeability(field_name, value)
      method("#{field_name}=").call(value)
    end
  end

  let(:target) { TestModel.new }

  describe 'background' do
    it 'should allow me to read the standard field' do
      expect(target.public_field).to be_nil
    end

    it 'should allow me to write to the standard field' do
      target.public_field = false
      expect(target.public_field).to be false
    end
  end

  describe '.private_field' do
    it 'should not allow me to read the private field' do
      expect { target.private_field }.to raise_error NoMethodError
    end

    it 'should not allow me to write to the private field' do
      expect { target.private_field = false }.to raise_error NoMethodError
    end

    it 'should still be readable internally' do
      expect(target.test_readability('private_field')).to be_nil
    end

    it 'should still be writable internally' do
      target.test_writeability('private_field', false)

      expect(target.send('private_field')).to be false
    end
  end

  describe '.readable_field' do
    it 'should allow me to read the readable field' do
      expect(target.readable_field).to be_nil
    end

    it 'should not allow me to write to the readable field' do
      expect { target.readable_field = false }.to raise_error NoMethodError
    end

    it 'should still be readable internally' do
      expect(target.test_readability('readable_field')).to be_nil
    end

    it 'should still be writable internally' do
      target.test_writeability('readable_field', false)

      expect(target.send('readable_field')).to be false
    end
  end
end
