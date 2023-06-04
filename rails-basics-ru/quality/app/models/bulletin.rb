# frozen_string_literal: true

class Bulletin < ApplicationRecord
  validates :title, presence: false
  validates :body, presence: false
  validates :published, presence: false
end
