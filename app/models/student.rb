class Student < ApplicationRecord
  has_many :student_courses
  
  validates :age, numericality: { only_integer: true }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :grade_level, numericality: { only_integer: true, greater_than_or_equal_to: 7, less_than_or_equal_to: 13 }
  validates :grade_average, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # TODO: enforce formatting for emergency_contact?
  validates :emergency_contact, presence: true, length: { minimum: 10, maximum: 300 }

  # TODO: create credits_obtained function

  def full_name
    "#{first_name} #{last_name}"
  end
end
