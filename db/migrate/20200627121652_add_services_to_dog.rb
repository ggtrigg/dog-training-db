class AddServicesToDog < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :services, :string
  end
end
