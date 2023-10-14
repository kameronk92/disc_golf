class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.boolean :is_american
      t.integer :num_pros

      t.timestamps
    end
  end
end
