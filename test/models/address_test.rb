require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "basic address and default fields" do
    addr = Address.new
    assert_not_nil addr, "New address is nil"
    assert_equal addr.state, 'Victoria'
    assert_equal addr.country, 'Australia'
  end
  
  test "address save" do
    addr = Address.new
    assert_not_nil addr, "New address is nil"
    assert_not addr.save
  end
  
  test "address parameters" do
    addr = Address.new(street1: '42 Wallaby Way', suburb: 'Sydney', postcode: 2000)
    assert_not_nil addr, "New address is nil"
    assert_equal '42 Wallaby Way', addr.street1, "address street1 expected"
    assert_nil addr.street2, "address street2 nil"
    assert_equal 'Sydney', addr.suburb, "address suburb expected"
    assert_equal '2000', addr.postcode, "address postcode expected"
  end
end
