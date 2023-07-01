# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      hostname = 'https://rails-collective-blog-ru.hexlet.app'
      sign_up_path = '/users/sign_up'
      users_path = '/users'

      uri = URI(hostname)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new URI.join(hostname, sign_up_path)
      response = http.request request
      cookie = response.response['set-cookie'].split('; ')[0]

      page = Nokogiri::HTML(response.body)
      authenticity_token = page.at('input[@name="authenticity_token"]')['value']
      post_params = {
        authenticity_token: ,
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password,
      }

      request = Net::HTTP::Post.new URI.join(hostname, users_path)
      request.body = URI.encode_www_form(post_params)
      request['Cookie'] = cookie

      http.request request
      # END
    end
  end
end
