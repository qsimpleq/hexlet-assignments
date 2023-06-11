class PostComment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
end
