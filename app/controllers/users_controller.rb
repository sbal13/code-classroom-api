class UsersController < ApplicationController
  def login
    user = User.order('RANDOM()').first
    render json: user
  end

  def create
    user = User.find_or_create_by(username: params[:username])

    if user
      render json: user
    else
      render json: {errors: "ya dun goofed!"}
    end
  end
end
