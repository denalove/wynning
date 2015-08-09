class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @high_level = @user.high_levels.build
    @one_month_goal = @high_level.one_month_goals.build
    @activity = @one_month_goal.activities.build
  end


  def show
    @high_level = HighLevel.new
    @high_levels = HighLevel.all
    @user = current_user
    @users = User.all
    @stream = {}
    @users.each do |usr|
      usr.high_levels.each do |hlg|
        day = hlg.updated_at.to_i
        hlg.check
        @stream[day] = [hlg, usr] if hlg.done
        hlg.one_month_goals.each do |omg|
          day = omg.updated_at.to_i
          omg.check
          @stream[day] = [omg, usr] if omg.done
            omg.activities.each do |act|
              day = act.updated_at.to_i
              @stream[day] = [act, usr] if act.done
            end
        end
      end
    end
  end

  def index
    @users = User.all
  end

  def create
  	@user = User.new user_params
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver_now
        @user.send_welcome
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
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :phone_number,
      high_levels_attributes: [
        :title, :due,
         one_month_goals_attributes: [
           :title, :end_date,
           activities_attributes: [
             :title, :due_date
           ]
         ]
      ]
    )
  end

end
