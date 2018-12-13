# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiApplicationController
      before_action :set_user, only: %i[show edit update destroy]

      # GET /users
      def index
        @users = User.all
        json_response(@users)
      end

      # GET /users/:id
      def show
        json_response(@user)
      end

      # POST /users
      def create
        @user = User.new(user_params)
        @user.save!
        json_response(@user, :created)
      end

      # PATCH/PUT /users/:id
      def update
        @user.update(user_params)
        head :no_content
      end

      # DELETE /users/:id
      def destroy
        @user.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(user_params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.permit(:id, :name, :cpf, :email)
      end
    end
  end
end
