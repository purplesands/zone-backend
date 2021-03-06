class AuthController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      # prove that the user exists in our database
      # -> lets send them a token!
      # -> the token will help us identify and validate our client
      jwt = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: jwt}
    else
      render json: {errors: "username or password incorrect!"}
    end
  end

  def auto_login
    @user = curr_user

    if @user
      render json: @user
    else
      render json: {errors: "please log in"}
    end
  end
end
