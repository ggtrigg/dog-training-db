class DogsChangeColumnType < ActiveRecord::Migration[5.1]
  def self.up
      change_column :dogs, :age, :decimal, { :precision => 8, :scale => 2}
  end

  def self.down
      change_column :dogs, :age, :integer
  end
end
