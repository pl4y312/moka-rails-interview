class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	User.create(
  		# email: ,
  		# first_name: ,
  		# last_name: ,
  	)

  	redirect_to login_path, notice: "The user successfully created."
  end
end
