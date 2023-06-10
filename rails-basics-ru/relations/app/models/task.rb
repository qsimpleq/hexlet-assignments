class Task < ApplicationRecord
  validates :name, presence: true, length: {minimum: 1}

  belongs_to :user
  belongs_to :status
end
