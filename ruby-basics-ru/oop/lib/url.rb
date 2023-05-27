# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN
class Url
  include Comparable
  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(uri)
    @uri = URI.parse uri
    query = @uri.query || ''
    @params = query
              .split('&')
              .each_with_object({}) do |pair, acc|
      key, value = pair.split '='
      acc[key.to_sym] = value
    end
  end

  def query_params
    @params
  end

  def query_param(key, value = nil)
    @params.fetch key, value
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end
end

# END
