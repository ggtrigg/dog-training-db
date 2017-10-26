class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.belongs_to :client, index: true
      t.belongs_to :event, index: true
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :status

      t.timestamps
    end
  end
end
