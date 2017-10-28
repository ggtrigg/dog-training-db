require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "event new" do
    ev = Event.new
    assert_not_nil ev, "Event creation nil"
  end
  
  test "event save" do
    ev = Event.new
    assert_not_nil ev, "Event creation nil"
    assert_not ev.save, "event save fail"
  end
  
  test "event parameters" do
    dt = DateTime.current
    ev = Event.new(date: dt, location: "At home", price: 120, duration: 90, event_type: "group_lesson")
    assert_not_nil ev, "Event creation nil"
    assert_equal dt, ev.date, "event date expected"
    assert_equal "At home", ev.location, "event location expected"
    assert_equal 120, ev.price, "event price expected"
    assert_equal 90, ev.duration, "event duration expected"
    assert_equal "group_lesson", ev.event_type, "event event_type expected"
  end
end
