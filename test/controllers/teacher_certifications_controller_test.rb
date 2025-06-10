require "test_helper"

class TeacherCertificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_certification = teacher_certifications(:one)
  end

  test "should get index" do
    get teacher_certifications_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_certification_url
    assert_response :success
  end

  test "should create teacher_certification" do
    assert_difference("TeacherCertification.count") do
      post teacher_certifications_url, params: { teacher_certification: { certifier: @teacher_certification.certifier, date_obtained: @teacher_certification.date_obtained, subject_id: @teacher_certification.subject_id, teacher_id: @teacher_certification.teacher_id } }
    end

    assert_redirected_to teacher_certification_url(TeacherCertification.last)
  end

  test "should show teacher_certification" do
    get teacher_certification_url(@teacher_certification)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_certification_url(@teacher_certification)
    assert_response :success
  end

  test "should update teacher_certification" do
    patch teacher_certification_url(@teacher_certification), params: { teacher_certification: { certifier: @teacher_certification.certifier, date_obtained: @teacher_certification.date_obtained, subject_id: @teacher_certification.subject_id, teacher_id: @teacher_certification.teacher_id } }
    assert_redirected_to teacher_certification_url(@teacher_certification)
  end

  test "should destroy teacher_certification" do
    assert_difference("TeacherCertification.count", -1) do
      delete teacher_certification_url(@teacher_certification)
    end

    assert_redirected_to teacher_certifications_url
  end
end
