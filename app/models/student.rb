class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses
  
  validates :age, numericality: { only_integer: true }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :grade_level, numericality: { only_integer: true, greater_than_or_equal_to: 7, less_than_or_equal_to: 13 }
  validates :grade_average, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # TODO: enforce formatting for emergency_contact?
  validates :emergency_contact, presence: true, length: { minimum: 10, maximum: 300 }

  def credits_obtained
    student_courses.where(credit_obtained: true).count
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
