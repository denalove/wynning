class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :complete, :edit, :update, :destroy]
  before_action :set_one_month_goal, only: [:create, :index, :one_month_goal]

  def index
    @activities = Activity.all
  end

  def show
    redirect_to @activity.one_month_goal
  end

  def complete
    @activity.complete
    redirect_to current_user
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    @activity.one_month_goal_id = @one_month_goal.id

     respond_to do |format|
      if @activity.save

        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @Activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def current_activity
    UserMailer.daily_activity_email(@user).deliver_later
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end
    def set_one_month_goal
      @one_month_goal = OneMonthGoal.find(params[:one_month_goal_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :due_date, :one_month_goal_id)
    end


end
