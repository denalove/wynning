class AddSummaryToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :summary, :string
  end
end
