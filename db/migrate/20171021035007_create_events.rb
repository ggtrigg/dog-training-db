class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :duration
      t.boolean :cancelled

      t.timestamps
    end
  end
end
