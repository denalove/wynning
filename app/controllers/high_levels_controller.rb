class HighLevelsController < ApplicationController
	before_action :set_high_level, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]

  def index
    @high_level = HighLevel.all
  end

  def show
  	@one_month_goal = OneMonthGoal.new
  	@one_month_goals = OneMonthGoal.all
  end

  def new
    @high_level = HighLevel.new
  end

  def create
    @high_level = HighLevel.new high_level_params
    @high_level.user_id = @user.id

    respond_to do |format|
      if @high_level.save
        format.html { redirect_to @user, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @high_level }
      else
        format.html { render :new }
        format.json { render json: @high_level.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@high_level.destroy
		redirect_to current_user
	end
  private

    def set_high_level
      @high_level = HighLevel.find(params[:id])
    end

    def set_user
			@user = current_user
      # @user = User.find(params[:user_id])
    end

    def high_level_params
      params.require(:high_level).permit(:title, :user_id, :due, :img)
    end
end
