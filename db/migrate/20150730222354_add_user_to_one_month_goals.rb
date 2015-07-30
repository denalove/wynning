class AddUserToOneMonthGoals < ActiveRecord::Migration
  def change
    add_reference :one_month_goals, :user, index: true, foreign_key: true
  end
end
