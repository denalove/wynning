class AddBooleanDaysToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :day1, :boolean
    add_column :activities, :day2, :boolean
    add_column :activities, :day3, :boolean
    add_column :activities, :day4, :boolean
    add_column :activities, :day5, :boolean
    add_column :activities, :day6, :boolean
    add_column :activities, :day7, :boolean
  end
end
