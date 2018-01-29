require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  test "initialization test" do
    assert_equal 2, Client.all.count, "clients loaded from fixture"
    assert_equal 2, Address.all.count, "addresses loaded from fixture"
    assert_equal 2, Dog.all.count, "dogs loaded from fixture"

    assert_equal 1, Client.first.dogs.all.count, "first client dog number"
    assert_equal 1, Client.last.dogs.all.count, "first client dog number"
  end
   
  test "visiting clients list" do
     visit clients_url

     assert_selector "h1", text: "Client list"
     assert_selector "th", text: "Firstname"
     assert_selector "td", text: "Bill"
     assert_selector "td", text: "Bloggs"
     assert_selector "td", text: "Jane"
     assert_selector "td", text: "Doe"
     # take_screenshot
  end

  # Test for adding empty client - should fail showing the same page
  # with the error div
  test "add empty client" do
    visit new_client_url

    assert_selector "label", text: "Firstname"
    assert_selector "div", id: "address-input-form"
    assert_selector "div", id: "dog-input-form"
    assert_selector "div", id: "event-input-form"
    assert_selector "div", id: "note-input-form"

    click_on "Create Client"

    assert_selector "div#error-explanation"
  end

  # Test for adding new client with all fields filled in.
  test "add new client" do
    visit new_client_url

    assert_selector "label", text: "Firstname"
    assert_selector "div#address-input-form"
    assert_selector "div#dog-input-form"
    assert_selector "div#event-input-form"
    assert_selector "div#note-input-form"

    fill_in "firstname", with: "John"
    fill_in "surname", with: "Doe"
    fill_in "phone_number", with: "1234 5678"
    fill_in "email_address", with: "john.doe@acme.com"

    # Address details
    fill_in "street1", with: "123 Candy Avenue"
    fill_in "suburb", with: "Emerald"
    fill_in "postcode", with: "3782"

    # Dog details
    fill_in "dog-name", with: "Fido"
    fill_in "breed", with: "Boxer"
    fill_in "age", with: "1.5"
    check "desexed"
    select('Male', from: 'sex')

    # Event details
    select('Private Lesson', from: 'event-type')
    fill_in "duration", with: "120"
    fill_in "price", with: "100"
    fill_in "date", with: "13122017\t1430"
    fill_in "location", with: "Client's house"
    # take_screenshot

    click_on "Create Client"

    assert_selector "div#client-name h2", text: "John Doe"
    assert_selector "h3", text: "1234 5678"
    assert_selector "th", text: "Fido"
    assert_selector "td a", text: "Private Lesson"
  end
   
  # Test for adding another dog to a client
  test "add dog to client" do
    visit client_url Client.first.id

    # Dog details
    fill_in "dog-name", with: "Mymutt"
    fill_in "breed", with: "St. Bernard"
    fill_in "age", with: "4.5"
    check "desexed"
    select('Male', from: 'sex')
    
    click_on "Create Dog"
    assert_selector "th", text: "Mymutt"
  end
   
  # Test for editing a client
  test "editing client" do
    visit edit_client_url Client.last.id
    
    # Change surname, phone number & email address
    fill_in "surname", with: "ZigZag"
    fill_in "phone_number", with: "0487652433"
    fill_in "email_address", with: "zigzag@nowhere.net"
    
    click_on "Update Client"
    assert_selector "div#client-name h2", text: Client.last.fullname
    assert_selector "h3", text: "0487 652 433"
    assert_selector "h3", text: "zigzag@nowhere.net"

  end
  
  # Test for adding a note to a client
  test "add note to client" do
    visit client_url Client.first.id
    
    fill_in "note[annotation]", with: "Here's a note added by system test."
    click_on "Create Note"
    
    assert_selector "div.client-note p", text: "Here's a note added by system test."
    # take_screenshot
  end
end
