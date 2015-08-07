class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.boolean :done
      t.string :summary
      t.date :last
      t.integer :score
      t.date :due_date
      t.references :one_month_goal, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
