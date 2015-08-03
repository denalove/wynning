class RemoveDays1Through7FromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :day1, :boolean
    remove_column :activities, :day2, :boolean
    remove_column :activities, :day3, :boolean
    remove_column :activities, :day4, :boolean
    remove_column :activities, :day5, :boolean
    remove_column :activities, :day6, :boolean
    remove_column :activities, :day7, :boolean
  end
end
