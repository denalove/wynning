class RemoveDaysFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :day1, :integer
    remove_column :activities, :day2, :integer
    remove_column :activities, :day3, :integer
    remove_column :activities, :day4, :integer
    remove_column :activities, :day5, :integer
    remove_column :activities, :day6, :integer
    remove_column :activities, :day7, :integer
  end
end
