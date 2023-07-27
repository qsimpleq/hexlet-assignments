# frozen_string_literal: true

require 'csv'

class Web::UsersController < Web::ApplicationController
  # BEGIN
  include ActionController::Live
  # END

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t('success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update(user_params)
      redirect_to @user, notice: t('success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find params[:id]

    @user.destroy

    redirect_to users_url, notice: t('success')
  end

  # Completed 200 OK in 26407ms (Views: 8.5ms | ActiveRecord: 1605.2ms | Allocations: 23610062)
  def normal_csv
    respond_to do |format|
      format.csv do
        csv = generate_csv(User.column_names, User.all)
        send_data(csv)
      end
    end
  end

  # BEGIN
  # Completed 200 OK in 63104ms (ActiveRecord: 834.6ms | Allocations: 47080770)
  def stream_csv
    response.headers['Content-Disposition'] = 'attachment; filename="stream_csv.csv"'
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers["Last-Modified"] = Time.current.httpdate.to_s
    response.stream.write User.column_names.to_csv
    User.find_each do |user|
      response.stream.write user.attributes.values.to_csv
    end
  ensure
    response.stream.close
  end

  # END

  private

  def generate_csv(column_names, records)
    CSV.generate do |csv|
      csv << column_names # add headers to the CSV
      records.find_each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
