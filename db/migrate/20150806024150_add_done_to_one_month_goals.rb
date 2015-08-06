class AddDoneToOneMonthGoals < ActiveRecord::Migration
  def change
    add_column :one_month_goals, :done, :boolean
  end
end
