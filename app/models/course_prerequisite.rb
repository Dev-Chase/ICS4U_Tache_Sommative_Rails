class CoursePrerequisite < ApplicationRecord
  belongs_to :course
  belongs_to :prerequisite_course, class_name: "Course"

  validates :course, presence: true
  validates :prerequisite_course, presence: true
end
