class RemoveStartFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :start, :date
  end
end
