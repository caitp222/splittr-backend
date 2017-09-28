class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.integer :payer_id, foreign_key: true
      t.integer :payee_id, foreign_key: true
      t.string :paypal_id

      t.timestamps
    end
  end
end
