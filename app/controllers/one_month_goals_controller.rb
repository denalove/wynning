class OneMonthGoalsController < ApplicationController
  before_action :set_one_month_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_high_level, only: [:create]

  def index
    @one_month_goals = OneMonthGoal.all
  end

  def show
    @activity = Activity.new
    @activities = Activity.all
    @user = current_user
  end

  def new
    @one_month_goal = OneMonthGoal.new
  end

  def destroy
    @one_month_goal.destroy
  end
  def create
    @one_month_goal = OneMonthGoal.new one_month_goal_params
    @one_month_goal.high_level_id = @high_level.id

    respond_to do |format|
      if @one_month_goal.save
        format.html { redirect_to current_user, notice: 'Goal was successfully created.' }
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
    def set_high_level
      @high_level = HighLevel.find(params[:high_level_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def one_month_goal_params
      params.require(:one_month_goal).permit(:title, :end_date, :high_level_id)
    end
end
