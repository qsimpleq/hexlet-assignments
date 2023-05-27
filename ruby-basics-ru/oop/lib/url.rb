# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN
class Url
  include Comparable
  extend Forwardable

  def initialize(uri)
    @uri = URI uri
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params()
    return {} unless @uri.query

    @uri.query.split('&').each_with_object({}) do |pair, result|
      key, value = pair.split("=")
      result[key.to_sym] = value
    end
  end

  def query_param(key, value = nil)
    query_params[key] || value
  end

  def ==(other_uri)
    scheme == other_uri.scheme &&
      host == other_uri.host &&
      port == other_uri.port &&
      query_params == other_uri.query_params
  end

end

# END
