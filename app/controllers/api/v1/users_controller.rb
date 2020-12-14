class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:create]

  def index
    users = User.all

    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
        payload = {user_id: user.id}
        token = encode_token(payload)
        puts token
        render json: {user: UserSerializer.new(user), jwt: token}
    else
        render json: {errors: "User not created"}
    end
end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
     @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :username, :city, :password, :password_confirmation)
    end
end
