class Api::V1::AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: UserSerializer.new(user), jwt: token}
        else
            render json: {errors: "Invalid Username/Password"}
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In"}
        end
    end

end