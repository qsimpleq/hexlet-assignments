class Task < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  validates :status, presence: true, length: { minimum: 1 }
  validates :creator, presence: true, length: { minimum: 1 }
  validates :completed, inclusion: [true, false]

  after_initialize :init

  def init
    self.status ||= 'new'
  end
end
