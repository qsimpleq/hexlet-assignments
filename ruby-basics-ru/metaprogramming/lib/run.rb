require_relative 'model'
require 'date'

class Post
  extend Model
  include Model

  attribute :id, type: :integer
  attribute :title, type: :string
  attribute :body, type: :string
  attribute :created_at, type: :datetime
  attribute :published, type: :boolean
end

attributes = {
  id: 1,
  title: 'Hello World',
  body: 'First post!',
  created_at: '01/03/2021',
  published: true,
  bullshit: 1,
}


post = Post.new attributes

pp post
pp post.id
# pp a.created_at
pp post.attributes
# pp a.instance_variable_get :@attributes_schema

