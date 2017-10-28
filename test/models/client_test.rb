require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Create basic client" do
    client = Client.new(firstname: "John", surname: "Doe")
    assert_not_nil client, "New client is nil"
    assert_equal "John", client.firstname, "Unexpected firstname"
    assert_equal "Doe", client.surname, "Unexpected surname"
  end
  
  test "save client with no firstname" do
    client = Client.new
    assert_not_nil client, "New client is nil"
    assert_not client.save, "Saved client with no firstname."
  end
  
  test "save client with firstname" do
    client = Client.new(firstname: "Bill")
    assert_not_nil client, "New client is nil"
    assert client.save
    last_client = Client.last
    assert_equal client, last_client
    assert_equal client.firstname, last_client.firstname
  end
end
