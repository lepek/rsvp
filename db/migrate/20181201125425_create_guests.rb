class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.references :main_guest, index: true, foreign_key: true
      t.timestamps
    end
  end
end
