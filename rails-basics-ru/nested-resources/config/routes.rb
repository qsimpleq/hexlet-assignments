# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  # BEGIN
  resources :posts, shallow: true do
    resources :post_comments, as: :comments, only: %i[create new index]
    resources :post_comments, only: %i[edit destroy show update]
  end
  # END
end
