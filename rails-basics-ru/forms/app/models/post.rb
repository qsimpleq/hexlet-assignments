class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { minimum: 1 }
  validates :published, inclusion: { in: [true, false] }
end
