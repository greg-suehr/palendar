require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "should not save Event without title" do
    myevent = Event.new
    assert_not myevent.save
  end

  test "should not save Event without start_time" do
    myevent = Event.new("title": "A simple event")
    assert_not myevent.save
  end

  test "should not save Event without end_time" do
    myevent = Event.new("title": "A simple event", "start_time": Time.current)
    assert_not myevent.save
  end

  test "should not save Event with end_time less than start_time" do
    myevent = Event.new("title": "A simple event", "start_time": Time.current, "end_time": 1.day.ago)
    assert_not myevent.save
  end

  test "should save Event with title, start_time, and end_time >= start_time" do
    myevent = Event.new("title": "A simple event", "start_time": Time.current, "end_time": 1.day.from_now)
    assert myevent.save
  end

  test "should save valid Event with start_time = end_time" do
    myevent = Event.new("title": "A simple event", "start_time": Time.current.end_of_day, "end_time": Time.current.end_of_day)
    assert myevent.save
  end
end
