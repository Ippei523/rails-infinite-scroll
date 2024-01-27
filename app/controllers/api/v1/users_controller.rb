module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery

      def index
        page = params[:page] || 1
        @users = User.page(page).per(10).order(id: :asc)

        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user = User.find(params[:id])
        @user.destroy
      end

      private

      def user_params
        params.require(:user).permit(:name)
      end
    end
  end
end