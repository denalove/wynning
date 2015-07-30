class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def show
    @user = current_user
  end

  def index
    @users = User.all
  end


  def create
  	@user = User.new user_params

  	if @user.save
      session[:user_id] = @user.id
  		redirect_to root_path, notice: "Created user"
  	else
  		render action: 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :high_level_goal, :email, :phone_number)
  end

end
