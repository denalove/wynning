class AddDaysToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :day1, :integer
    add_column :activities, :day2, :integer
    add_column :activities, :day3, :integer
    add_column :activities, :day4, :integer
    add_column :activities, :day5, :integer
    add_column :activities, :day6, :integer
    add_column :activities, :day7, :integer
  end
end
