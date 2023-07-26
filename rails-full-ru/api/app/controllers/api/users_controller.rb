# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
    respond_with @users.to_json
  end

  def show
    @user = User.find(params[:id])
    respond_with @user.to_json
  end
  # END
end
