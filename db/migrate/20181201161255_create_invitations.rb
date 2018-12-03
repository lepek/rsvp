class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :event, foreign_key: true
      t.references :main_guest, foreign_key: true
      t.integer :attendance, default: 0
      t.text :notes
      t.integer :adults, default: 0
      t.integer :kids, default: 0
      t.timestamps
    end
  end
end
