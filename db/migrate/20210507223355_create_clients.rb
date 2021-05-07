class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name, null: false
      t.string :last_name
      t.float :annual_income
      t.integer :credit_score
      t.string :property_size
      t.integer :min_price
      t.integer :max_price
      t.string :neighborhood
      t.boolean :guarantor
      t.timestamps
    end
  end
end
