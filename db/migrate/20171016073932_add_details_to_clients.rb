class AddDetailsToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :phone_number, :string
    add_column :clients, :email_address, :string
  end
end
