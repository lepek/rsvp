class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :address
      t.text :description
      t.string :image
      t.string :header
      t.timestamps
    end
  end
end
