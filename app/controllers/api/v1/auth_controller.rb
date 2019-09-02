class Api::V1::AuthController < ApplicationController
  before_action :authorize, only: [:auto_login]

  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = encode_token(user.id)

      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: "Login failed!"}
    end
  end

  def auto_login
    render json: session_user
  end
end
