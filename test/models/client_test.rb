require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Create basic client" do
    client = Client.new(firstname: "John", surname: "Doe")
    assert_equal client.firstname, "John"
    # assert_equal client.surname, "Doe"
  end
end
