require "test_helper"

class CoursePrerequisitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_prerequisite = course_prerequisites(:one)
  end

  test "should get index" do
    get course_prerequisites_url
    assert_response :success
  end

  test "should get new" do
    get new_course_prerequisite_url
    assert_response :success
  end

  test "should create course_prerequisite" do
    assert_difference("CoursePrerequisite.count") do
      post course_prerequisites_url, params: { course_prerequisite: { course_id: @course_prerequisite.course_id, prerequisite_course_id: @course_prerequisite.prerequisite_course_id } }
    end

    assert_redirected_to course_prerequisite_url(CoursePrerequisite.last)
  end

  test "should show course_prerequisite" do
    get course_prerequisite_url(@course_prerequisite)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_prerequisite_url(@course_prerequisite)
    assert_response :success
  end

  test "should update course_prerequisite" do
    patch course_prerequisite_url(@course_prerequisite), params: { course_prerequisite: { course_id: @course_prerequisite.course_id, prerequisite_course_id: @course_prerequisite.prerequisite_course_id } }
    assert_redirected_to course_prerequisite_url(@course_prerequisite)
  end

  test "should destroy course_prerequisite" do
    assert_difference("CoursePrerequisite.count", -1) do
      delete course_prerequisite_url(@course_prerequisite)
    end

    assert_redirected_to course_prerequisites_url
  end
end
