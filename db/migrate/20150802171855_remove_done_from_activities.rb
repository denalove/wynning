class RemoveDoneFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :done, :boolean
  end
end
