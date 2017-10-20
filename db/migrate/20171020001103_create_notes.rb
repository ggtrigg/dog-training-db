class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :annotatable, polymorphic: true
      t.text :annotation

      t.timestamps
    end
  end
end
