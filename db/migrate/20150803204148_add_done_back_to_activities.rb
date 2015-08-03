class AddDoneBackToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :done, :boolean
  end
end
