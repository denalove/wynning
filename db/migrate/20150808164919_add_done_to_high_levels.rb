class AddDoneToHighLevels < ActiveRecord::Migration
  def change
    add_column :high_levels, :done, :boolean
  end
end
