class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.references :property
      t.references :client
      t.datetime :time
      t.timestamps
    end
  end
end
