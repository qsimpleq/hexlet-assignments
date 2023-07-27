class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :full_name

  has_many :posts
end
