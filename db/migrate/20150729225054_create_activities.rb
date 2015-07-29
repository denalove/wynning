class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.boolean :done

      t.timestamps null: false
    end
  end
end
