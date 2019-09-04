class ApplicationController < ActionController::API


  def encode_token(user_id)
    JWT.encode({user_id: user_id}, "super_secret")
  end

  def get_headers
    request.headers["Authorization"]
  end

  def decode_token
    begin
      JWT.decode(get_headers, "super_secret")[0]["user_id"]
    rescue
      nil
    end
  end

  def session_user
    User.find_by(id: decode_token)
  end

  def logged_in?
    !!session_user
  end

  def authorize
    if !logged_in?
      render json: {errors: "Invalid token"}, status: 403
    end
  end

  def admin?
    session_user.admin
  end
end
