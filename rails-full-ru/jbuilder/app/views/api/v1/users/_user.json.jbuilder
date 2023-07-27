json.extract! user, :id, :email, :address, :full_name
json.posts(user.posts, partial: 'api/v1/users/posts', as: :post)
