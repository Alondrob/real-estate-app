class AddUnitNumberToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :unit_number, :string
  end
end
