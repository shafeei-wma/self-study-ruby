module Api
  module V1
    class UsersController < BaseController

      skip_before_action :verify_authenticity_token
      # before_action :authenticate_user!, only: [:update_password, :another_action]

      def index
        users = User.all
        render status: :ok, json: users
      end

      def create
        user = User.new(user_params)
        ActiveRecord::Base.transaction do
          begin
            user.save!
            render status: :ok, json: user
          rescue ActiveRecord::RecordInvalid => e
            render status: :unprocessable_entity, json: {
              errors: e.record.errors
            }  
          end
        end
      end

      def log_in
        puts "login"
        user = User.find_by_email(user_login_params[:email])
        puts user.inspect
        if user&.valid_password?(user_login_params[:password])
          sign_in user
          render json: { message: "Logged in successfully.", data: user}
        else
          render json: { error: "Invalid email or password." }, status: :unauthorized
        end
      end

      def update_password
        puts "login first"
        @user = User.find_by_email(user_login_params[:email])
        if @user&.valid_password?(user_login_params[:password])
          sign_in @user

          # update pwd
          new_password = 'password_here' # cyrrently update new pass to same as old to prevent needd modify login in client pass and error to test later
          @user.password = new_password
          @user.username = "keh3"

          result = @user.save
          if result
            bypass_sign_in(@user)
            render json: { message: 'Password updated successfully.', data: @user}
          else
            render json: { error: "Password not update!." }, status: :unauthorized
          end
        else
          render json: { error: "Invalid email or password." }, status: :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :username)
      end

      def user_login_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end