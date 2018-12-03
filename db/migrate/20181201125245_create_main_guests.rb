class CreateMainGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :main_guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :total_guests
      t.timestamps
    end

    add_index :main_guests, :email, unique: true
  end
end
