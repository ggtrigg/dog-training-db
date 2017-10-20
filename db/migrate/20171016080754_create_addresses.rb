class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :suburb
      t.string :postcode
      t.string :state
      t.string :country
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
