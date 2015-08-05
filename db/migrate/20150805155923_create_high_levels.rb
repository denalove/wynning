class CreateHighLevels < ActiveRecord::Migration
  def change
    create_table :high_levels do |t|
      t.string :title
      t.date :due
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
