class AddOneMonthGoalToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :one_month_goal, index: true, foreign_key: true
  end
end
