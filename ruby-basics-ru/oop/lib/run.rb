# frozen_string_literal: true

require_relative 'url'

yandex_url = Url.new 'http://yandex.ru?key=value&key2=value2'
pp yandex_url.host # yandex.ru
pp yandex_url.scheme # http
pp yandex_url.query_params
