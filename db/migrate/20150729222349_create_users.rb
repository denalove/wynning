class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :membership_level
      t.string :high_level_goal

      t.timestamps null: false
    end
  end
end
