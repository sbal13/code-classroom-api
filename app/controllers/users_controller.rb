class UsersController < ApplicationController
  def login
    user = User.order('RANDOM()').first
    render json: user
  end
end
