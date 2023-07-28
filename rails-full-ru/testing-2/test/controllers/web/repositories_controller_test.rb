# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create' do
    json_response = load_fixture('files/response.json')
    test_response = JSON.parse(json_response)
    link = test_response['html_url']

    stub_request(:get, test_response['url']).to_return(status: 200, body: json_response)

    assert_difference('Repository.count') do
      post repositories_path, params: { repository: { link: } }
    end

    assert_response :redirect
  end
  # END
end
