class AddPhotoToHighLevels < ActiveRecord::Migration
  def change
    add_column :high_levels, :img, :string
  end
end
