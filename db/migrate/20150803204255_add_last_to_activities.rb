class AddLastToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :last, :date
  end
end
