class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    existing_user = User.find_by_email(params[:email])
    if existing_user
      redirect_to '/signup', alert: "Email already exists"
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/', notice: 'User successfully registered.'
      else
        redirect_to '/signup'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
