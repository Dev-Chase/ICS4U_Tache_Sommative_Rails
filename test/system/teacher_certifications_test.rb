require "application_system_test_case"

class TeacherCertificationsTest < ApplicationSystemTestCase
  setup do
    @teacher_certification = teacher_certifications(:one)
  end

  test "visiting the index" do
    visit teacher_certifications_url
    assert_selector "h1", text: "Teacher certifications"
  end

  test "should create teacher certification" do
    visit teacher_certifications_url
    click_on "New teacher certification"

    fill_in "Certifier", with: @teacher_certification.certifier
    fill_in "Date obtained", with: @teacher_certification.date_obtained
    fill_in "Subject", with: @teacher_certification.subject_id
    fill_in "Teacher", with: @teacher_certification.teacher_id
    click_on "Create Teacher certification"

    assert_text "Teacher certification was successfully created"
    click_on "Back"
  end

  test "should update Teacher certification" do
    visit teacher_certification_url(@teacher_certification)
    click_on "Edit this teacher certification", match: :first

    fill_in "Certifier", with: @teacher_certification.certifier
    fill_in "Date obtained", with: @teacher_certification.date_obtained.to_s
    fill_in "Subject", with: @teacher_certification.subject_id
    fill_in "Teacher", with: @teacher_certification.teacher_id
    click_on "Update Teacher certification"

    assert_text "Teacher certification was successfully updated"
    click_on "Back"
  end

  test "should destroy Teacher certification" do
    visit teacher_certification_url(@teacher_certification)
    click_on "Destroy this teacher certification", match: :first

    assert_text "Teacher certification was successfully destroyed"
  end
end
