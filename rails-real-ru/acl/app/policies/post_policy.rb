# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (user.admin? || user.id == post.author_id)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.admin?
  end
  # END
end
