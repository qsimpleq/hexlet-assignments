# frozen_string_literal: true

module Web::Movies
  class CommentsController < ApplicationController
    before_action :resource_movie
    before_action :set_comment, only: %i[edit destroy update]

    def index
      @comments = @movie.comments.all
    end

    def new
      @comment = @movie.comments.build
    end

    def create
      @comment = @movie.comments.build(comment_params)
      if @comment.save
        redirect_to movie_comments_path(@movie), notice: 'Comment was successfully created.'
      else
        render :new, alert: 'Comment could not be created'
      end
    end

    def edit
    end

    def update
      if @comment.update(comment_params)
        redirect_to movie_comments_path(@movie), notice: 'Comment was successfully updated.'
      else
        render :edit, alert: 'Comment could not be updated'
      end
    end

    def destroy
      if @comment.destroy
        redirect_to movie_comments_path(@movie), notice: 'Comment was successfully destroyed.'
      else
        redirect_to movie_comments_path(@movie), alert: 'Comment was successfully destroyed.'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_comment
      @comment = @movie.comments.find(params[:id])
    end

  end
end
