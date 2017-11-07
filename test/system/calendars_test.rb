require "application_system_test_case"

class CalendarsTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit root_url
  
     assert_selector "table", class: "calendar"
   end
end
