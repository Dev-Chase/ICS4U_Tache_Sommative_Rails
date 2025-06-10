require "application_system_test_case"

class CoursePrerequisitesTest < ApplicationSystemTestCase
  setup do
    @course_prerequisite = course_prerequisites(:one)
  end

  test "visiting the index" do
    visit course_prerequisites_url
    assert_selector "h1", text: "Course prerequisites"
  end

  test "should create course prerequisite" do
    visit course_prerequisites_url
    click_on "New course prerequisite"

    fill_in "Course", with: @course_prerequisite.course_id
    fill_in "Prerequisite course", with: @course_prerequisite.prerequisite_course_id
    click_on "Create Course prerequisite"

    assert_text "Course prerequisite was successfully created"
    click_on "Back"
  end

  test "should update Course prerequisite" do
    visit course_prerequisite_url(@course_prerequisite)
    click_on "Edit this course prerequisite", match: :first

    fill_in "Course", with: @course_prerequisite.course_id
    fill_in "Prerequisite course", with: @course_prerequisite.prerequisite_course_id
    click_on "Update Course prerequisite"

    assert_text "Course prerequisite was successfully updated"
    click_on "Back"
  end

  test "should destroy Course prerequisite" do
    visit course_prerequisite_url(@course_prerequisite)
    click_on "Destroy this course prerequisite", match: :first

    assert_text "Course prerequisite was successfully destroyed"
  end
end
