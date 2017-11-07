require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "Create basic client" do
    client = Client.new(firstname: "John", surname: "Doe")
    assert_not_nil client, "New client is nil"
    assert_equal "John", client.firstname, "Unexpected firstname"
    assert_equal "Doe", client.surname, "Unexpected surname"
    assert_equal "John Doe", client.fullname, "full name test"
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
  
  test "client phonenumber" do
    client = Client.new()
    # Test nil phone number
    assert_nil client.phone_number, "nil phone number"
    assert_equal "", client.phonenum_format, "blank formatted phone number"
    client.firstname = "Andy"
    assert client.save, "saving nil phone number"
    client.phone_number = ""
    assert client.save, "saving blank phone number"
    
    # test non-standard phone numbers
    client.phone_number = "2345"
    assert_equal "2345", client.phone_number, "four digit number"
    assert_equal "2345", client.phonenum_format, "four digit number formatted"
    assert client.save, "saving four digit number"
    
    # test non-standard phone numbers with spaces
    client.phone_number = "67 12 "
    assert_equal "6712", client.phone_number, "four digit number and spaces"
    assert_equal "6712", client.phonenum_format, "four digit number and spaces formatted"
    assert client.save, "saving four digit number with spaces"
    
    # test alpha characters in phone number
    client.phone_number = "br*2"
    assert_equal "br*2", client.phone_number, "alpha characters in phone number"
    assert_equal "br*2", client.phonenum_format, "alpha characters in phone number formatted"
    assert_not client.save, "saving alpha characters in phone number"

    # test alpha characters and spaces in phone number
    client.phone_number = " z4 *@ m"
    assert_equal "z4*@m", client.phone_number, "alpha charactersand spaces in phone number"
    assert_equal "z4*@m", client.phonenum_format, "alpha charactersand spaces in phone number formatted"
    assert_not client.save, "saving alpha characters & spaces in phone number"

    # test landline number
    client.phone_number = "0398764562"
    assert_equal "0398764562", client.phone_number, "landline phone number"
    assert_equal "03 9876 4562", client.phonenum_format, "landline phone number formatted"
    assert client.save, "saving landline phone number"
    
    # test mobile number with spaces
    client.phone_number = "04 4567 1234"
    assert_equal "0445671234", client.phone_number, "mobile phone number"
    assert_equal "0445 671 234", client.phonenum_format, "mobile phone number formatted"
    assert client.save, "saving mobile phone number"
    
    # test 8 digit number (no area code)
    client.phone_number = "42 6712 94"
    assert_equal "42671294", client.phone_number, "8 digit phone number"
    assert_equal "4267 1294", client.phonenum_format, "8 digit phone number formatted"
    assert client.save, "saving 8 digit phone number"
  end
end
