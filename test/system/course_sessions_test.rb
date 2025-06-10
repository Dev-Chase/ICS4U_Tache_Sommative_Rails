require "application_system_test_case"

class CourseSessionsTest < ApplicationSystemTestCase
  setup do
    @course_session = course_sessions(:one)
  end

  test "visiting the index" do
    visit course_sessions_url
    assert_selector "h1", text: "Course sessions"
  end

  test "should create course session" do
    visit course_sessions_url
    click_on "New course session"

    fill_in "Course", with: @course_session.course_id
    fill_in "Day of week", with: @course_session.day_of_week
    fill_in "Duration", with: @course_session.duration
    fill_in "Room", with: @course_session.room_id
    fill_in "Start time", with: @course_session.start_time
    click_on "Create Course session"

    assert_text "Course session was successfully created"
    click_on "Back"
  end

  test "should update Course session" do
    visit course_session_url(@course_session)
    click_on "Edit this course session", match: :first

    fill_in "Course", with: @course_session.course_id
    fill_in "Day of week", with: @course_session.day_of_week
    fill_in "Duration", with: @course_session.duration
    fill_in "Room", with: @course_session.room_id
    fill_in "Start time", with: @course_session.start_time.to_s
    click_on "Update Course session"

    assert_text "Course session was successfully updated"
    click_on "Back"
  end

  test "should destroy Course session" do
    visit course_session_url(@course_session)
    click_on "Destroy this course session", match: :first

    assert_text "Course session was successfully destroyed"
  end
end
