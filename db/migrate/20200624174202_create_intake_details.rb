class CreateIntakeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :intake_details do |t|
      t.text :text
      t.references :intake_form, foreign_key: true
      t.references :intake_item, foreign_key: true

      t.timestamps
    end
  end
end
