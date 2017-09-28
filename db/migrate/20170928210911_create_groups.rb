class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :group_name, null: false
      t.text :details
      t.integer :creator_id, foreign_key: true
      t.boolean :settled_up, default: false

      t.timestamps
    end
  end
end
