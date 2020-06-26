class CreateIntakeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :intake_items do |t|
      t.text :text

      t.timestamps
    end
  end
end
