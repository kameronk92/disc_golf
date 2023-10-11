class CreateDiscs < ActiveRecord::Migration[7.0]
  def change
    create_table :discs do |t|
      t.integer :manufacturer_id
      t.string :mold_name
      t.boolean :overstable
      t.integer :speed

      t.timestamps
    end
  end
end
