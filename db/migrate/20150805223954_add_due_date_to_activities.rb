class AddDueDateToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :due_date, :date
  end
end
