class Users::RegistrationsController < ApplicationController
  def create
    user = User.new(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      role: params['user']['role'],
    )

    if user.save
      session[:user_id] = user.id
      render json: {
        status: 201,
        user: user
      }
    else
      render json: {
        errors: user.errors.full_messages,
        status: 422
      }
    end
  end
end