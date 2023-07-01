# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class CommentsTest < ApplicationSystemTestCase
  setup do
    @post_one = posts(:one)
    @comment_one = post_comments(:one)
    @comment_two = post_comments(:two)

    visit post_url(@post_one)
  end

  test 'creating a Comment' do
    click_on 'Create Comment'

    fill_in 'post_comment_body', with: @comment_two.body

    click_on 'Create Comment'

    assert_text 'Comment was successfully created.'
  end

  test 'updating a Comment' do
    click_link 'Edit', match: :first

    assert_selector 'h1.h2', text: 'Editing comment'

    fill_in 'post_comment_body', with: @comment_two.body
    click_on 'Update Comment'

    assert_text 'Comment was successfully updated.'
  end

  test 'destroying a Comment' do
    page.accept_confirm { click_link 'Delete', match: :first }
  end
end

# END
