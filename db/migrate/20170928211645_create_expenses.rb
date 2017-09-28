class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.references :membership, foreign_key: true
      t.float :amount, null: false
      t.string :vendor, null: false
      t.text :description
      t.text :photo_text
      t.string :google_vision_id

      t.timestamps
    end
  end
end
