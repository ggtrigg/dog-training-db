class AddDobToDog < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :dob, :date
  end
end
