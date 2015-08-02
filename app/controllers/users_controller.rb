class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end


  def show
    @one_month_goal = OneMonthGoal.new
    @user = current_user
  end

  def index
    @users = User.all
  end

  def create
  	@user = User.new user_params
    respond_to do |format|
      if @user.save
       session[:user_id] = @user.id
      #  UserMailer.welcome_email(@user).deliver_now
       format.html { redirect_to @user, notice: "User was successfully created." }
       format.json { render json: @user, status: :created, location: @user }
     else
      format.html { render action: 'new', notice: "User could not be created" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :high_level_goal, :email, :phone_number)
end

end
