class AddKidToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :kid, :boolean
  end
end
