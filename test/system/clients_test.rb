require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
   test "visiting clients list" do
     visit clients_url
  
     assert_selector "h1", text: "Client list"
     assert_selector "th", text: "Firstname"
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
    assert_selector "div", id: "address-input-form"
    assert_selector "div", id: "dog-input-form"
    assert_selector "div", id: "event-input-form"
    assert_selector "div", id: "note-input-form"
    
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
    
    assert_selector "h2", text: "John Doe"
   end
end
