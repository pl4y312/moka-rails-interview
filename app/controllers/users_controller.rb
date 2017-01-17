class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  # Registration page
  # GET /users/new
  def new
    @user = User.new
  end

  # Create new user
  # POST /users
  def create
  	@user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "The registration success, you can login now."
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
