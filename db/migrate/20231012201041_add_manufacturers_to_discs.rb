class AddManufacturersToDiscs < ActiveRecord::Migration[7.0]
  def change
    add_reference :discs, :manufacturer, null: false, foreign_key: true
  end
end
