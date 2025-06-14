class CoursePrerequisite < ApplicationRecord
  belongs_to :course
  belongs_to :prerequisite_course, class_name: "Course", foreign_key: :prerequisite_course_id

  validates :course, presence: true
  validates :prerequisite_course, presence: true

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
