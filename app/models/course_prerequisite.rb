class CoursePrerequisite < ApplicationRecord
  belongs_to :course
  belongs_to :prerequisite_course

  validates :course, presence: true
  validates :prerequisite_course, presence: true
end
