class AddStartDateToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :start, :date
  end
end
