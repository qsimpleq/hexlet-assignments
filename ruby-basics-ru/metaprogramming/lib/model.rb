# frozen_string_literal: true

# BEGIN
module Model
  attr_reader :attributes, :attribute_options

  def self.included(base)
    base.extend self
  end

  def initialize(attributes = {})
    @attributes = {}

    self.class.attribute_options.each do |name, options|
      method("#{name}=").call attributes.fetch(name, options.fetch(:default, nil))
    end
  end

  def attribute(name, options = {})
    @attribute_options ||= {}
    @attribute_options[name] = options

    define_method :"#{name}" do
      @attributes[name]
    end

    define_method :"#{name}=" do |value|
      @attributes[name] = attribute_typed_value(value, options[:type])
    end
  end

  private

  def attribute_typed_value(value, type)
    return value if type.nil? || value.nil?

    case type
    when :boolean then !!value
    when :datetime then DateTime.parse value
    when :integer then value.to_i
    when :string then value.to_s
    else value
    end
  end
end
# END
