# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post_one = posts(:one)
    @post_two = posts(:two)
    @post_without_comments = posts(:without_comments)

  end

  test 'visiting the index' do
    visit posts_url

    assert_selector 'h1.h2', text: 'Posts', match: :first

    posts.each { |post| assert_selector 'table tbody tr td', text: post.title, match: :first }
  end

  test 'creating a Post' do
    visit posts_url

    click_on 'New Post'

    fill_in 'post_title', with: @post_one.title
    fill_in 'post_body', with: @post_one.body

    click_on 'Create Post'

    assert_text 'Post was successfully created.'
  end

  test 'updating a Post' do
    visit posts_url

    click_on 'Edit', match: :first

    assert_selector 'h1.h2', text: 'Editing post'

    fill_in 'post_body', with: @post_two.body
    click_on 'Update Post'

    assert_text 'Post was successfully updated.'
  end

  test 'destroying a Post' do
    visit posts_url

    page.accept_confirm { click_link 'Destroy', match: :first }

    assert_text 'Post was successfully destroyed.'
  end
end

# END
