class CreatProperties < ActiveRecord::Migration[6.1]
  def change
      create_table :properties do |t|
      t.string :management, null: false
      t.string :address, null: false   
      t.integer :size, null: false
      t.string :neighborhood, null: false
      t.string :status, null: false
      t.integer :price
      t.integer :floor, null: false
      t.string :notes
      t.timestamps
    end
  end
end
