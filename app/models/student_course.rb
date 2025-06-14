class StudentCourse < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates :course, presence: true
  validates :student, presence: true
  validates :average_grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :credit_obtained, presence: true

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
