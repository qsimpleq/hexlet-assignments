# frozen_string_literal: true

require 'date'

# BEGIN
module Model
  @@attributes_schema = {}

  def attribute(name, options = {})
    @@attributes_schema[name] = options

    define_method name.to_s do
      @attributes[name]
    end

    define_method "#{name}=" do |value|
      @attributes[name] = attribute_typed_value name, value
    end
  end

  define_method :attribute_typed_value do |name, value|
    return nil if value.nil?

    case @@attributes_schema[name][:type]
    when :integer then value.to_i
    when :boolean then value ? true : false
    when :string then value.to_s
    when :datetime then DateTime.parse value
    else value
    end
  end

  def initialize(attributes = {})
    @attributes = attributes
                  .keys
                  .each_with_object({}) do |key, acc|
      acc[key] = @@attributes_schema.key?(key) ? attribute_typed_value(key, attributes[key]) : attributes[key]
    end

    @@attributes_schema.each_key do |attr|
      if @@attributes_schema[attr].key?(:default) && !@attributes.key?(attr)
        @attributes[attr] = @@attributes_schema[attr][:default]
      end
    end
  end

  def attributes
    @attributes
  end
end
# END
