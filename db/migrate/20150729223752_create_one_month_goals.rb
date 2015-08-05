class CreateOneMonthGoals < ActiveRecord::Migration
  def change
    create_table :one_month_goals do |t|
      t.string :title
      t.string :description
      t.date :end_date
      t.date :date_done
      t.float :metric

      t.references :high_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
