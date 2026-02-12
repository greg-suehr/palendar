require "application_system_test_case"

class Admin::EventsTest < ApplicationSystemTestCase
  test "creating and publishing an event" do
    visit new_admin_event_path

    fill_in "Title", with: "Pittsburgh Coffee Meetup"
    fill_in "Description", with: "Let's talk tech"
    fill_in "Location", with: "Espresso a Mano"
    fill_in "Start time", with: 1.day.from_now
    fill_in "End time", with: 1.day.from_now + 2.hours

    click_on "Create Event"

    assert_text "Pittsburgh Coffee Meetup"
    assert_text "Let's talk tech"
    assert_text "Espresso a Mano"

    accept_confirm do
      click_on "Publish"
    end

    assert_text "Published"
  end
end
