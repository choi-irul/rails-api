# frozen_string_literal: true

module Api
  class UsersController < ApiController
    before_action :authorize_request, except: :create
    before_action :prepare_user, except: %i[create index]

    def index
      @users = User.all
      render json: @users, status: :ok
    end

    def show
      render json: @user, status: :ok
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
    end

    private

    def prepare_user
      @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
      params.permit(
        :avatar, :name, :username, :email, :password, :password_confirmation
      )
    end
  end
end
