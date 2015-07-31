class OneMonthGoalsController < ApplicationController
  before_action :set_one_month_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]

  def index
    @one_month_goals = OneMonthGoal.all
  end

  def status
    @user=current_user
  end

  def show
    redirect_to user_path
  end

  def new
    @one_month_goal = OneMonthGoal.new
  end

  def create
    @one_month_goal = OneMonthGoal.new one_month_goal_params
    @one_month_goal.user_id = @user.id

    respond_to do |format|
      if @one_month_goal.save
        format.html { redirect_to @one_month_goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @one_month_goal }
      else
        format.html { render :new }
        format.json { render json: @one_month_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_month_goal
      @one_month_goal = OneMonthGoal.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def one_month_goal_params
      params.require(:one_month_goal).permit(:title, :description, :user_id)
    end
end
