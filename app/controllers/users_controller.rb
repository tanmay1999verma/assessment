class UsersController < ApplicationController

  def create
    if params[:name].blank? || params[:email].blank? || params[:phone_number].blank? || params[:password].blank?
      raise StandardError.new, "Name, Email, Phone Number, Password Required."
    end

    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.phone_number = params[:phone_number]
    user.encrypt_password(params[:password])
    if user.save
      render json: { message: 'User created successfully' }, status: 200
    else
      raise StandardError.new, user.errors.full_messages
    end

  rescue => e
    render json: { message: e.message }, status: 400
  end

end
