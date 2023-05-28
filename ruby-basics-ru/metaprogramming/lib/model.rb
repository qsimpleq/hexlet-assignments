# frozen_string_literal: true

# BEGIN
module Model
  @@attributes_schema = {}

  def attribute(name, options = {})
    @@attributes_schema[name] = options

    define_method "#{name}" do
      @attributes[name]
    end

    define_method "#{name}=" do |value|
      @attributes[name] = attribute_typed_value name, value
    end
  end

  define_method :attribute_typed_value do |name, value|
    case @@attributes_schema[name][:type]
    when :integer then value.to_i
    when :boolean then value ? true : false
    when :string then value.to_s
    when :datetime then Date.parse value
    else value
    end
  end

  def initialize(attributes = {})
    @attributes = attributes
                    .select { |key| @@attributes_schema.key? key }
                    .keys
                    .each_with_object({}) do |key, acc|
      acc[key] = attribute_typed_value key, attributes[key]
    end

    @@attributes_schema.each do |key, value|
      if @@attributes_schema[key].key?(:default) && !@attributes.key?(key)
        @attributes[key] = @@attributes_schema[key][:default]
      end
    end
  end

  def attributes
    @attributes
  end

end
# END
