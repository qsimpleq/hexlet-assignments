# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  before_action :set_post, except: %i[index new create]
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id if current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end

    authorize @post
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, alert: 'Post can\'t be updated.'
    end
  end

  def destroy
    authorize @post
    @post.destroy

    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to new_session_path # Перенаправляем пользователя на страницу авторизации
  # end

  # END
end
