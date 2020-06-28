class ChangeFieldTypeOnDog < ActiveRecord::Migration[5.2]
  def up
    change_column :dogs, :age, :string
  end
  def down
    change_column :dogs, :age, :integer
  end
end
