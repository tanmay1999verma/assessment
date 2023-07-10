class SessionsController < ApplicationController
  def login
    raise StandardError.new, "Email Required." if params[:email].blank?
    raise StandardError.new, "Password Required." if params[:password].blank?
    user = User.find_by(email: params[:email])

    if user && user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: 'Login successful'}, status: 200
    else
      raise StandardError.new, "Invalid username or password."
    end
  rescue => e
    render json: { message: e.message}, status: 400
  end

end
