class AddColumnToIntakeForm < ActiveRecord::Migration[5.2]
  def change
    add_reference :intake_forms, :dog, foreign_key: true
  end
end
