class Task < ApplicationRecord
  attr_accessor :statuses

  validates :name, :status, :creator, { presence: true, allow_blank: false }
  validates :completed, inclusion: [true, false]

  def self.statuses
    %w[new in_progress completed]
  end
end
