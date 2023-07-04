# frozen_string_literal: true

module Web::Movies
  class ReviewsController < ApplicationController
    before_action :resource_movie
    before_action :set_review, only: %i[edit destroy update]

    def index
      @reviews = @movie.reviews.all
    end

    def new
      @review = @movie.reviews.build
    end

    def create
      @review = @movie.reviews.build(review_params)
      if @review.save
        redirect_to movie_reviews_path(@movie), notice: 'Review was successfully created.'
      else
        render :new, alert: 'Review could not be created'
      end
    end

    def edit
    end

    def update
      if @review.update(review_params)
        redirect_to movie_reviews_path(@movie), notice: 'Review was successfully updated.'
      else
        render :edit, alert: 'Review could not be updated'
      end
    end

    def destroy
      if @review.destroy
        redirect_to movie_reviews_path(@movie), notice: 'Review was successfully destroyed.'
      else
        redirect_to movie_reviews_path(@movie), alert: 'Review was successfully destroyed.'
      end
    end

    private

    def review_params
      params.require(:review).permit(:body)
    end

    def set_review
      @review = @movie.reviews.find(params[:id])
    end

  end
end
