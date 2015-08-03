class AddScoreToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :score, :integer
  end
end
