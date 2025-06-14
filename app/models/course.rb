class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :course_sessions
  has_many :student_courses
  has_many :students, through: :student_courses
  has_many :course_prerequisites, foreign_key: :course_id
  has_many :prerequisites, through: :course_prerequisites, source: :prerequisite_course

  validates :teacher, presence: true
  validates :subject, presence: true
  validates :code, length: { minimum: 2, maximum: 20 }
  validates :school_year, length: { minimum: 4, maximum: 15 }, presence: true
  validates :description, length: { minimum: 10, maximum: 400 }, presence: true
  validates :name, length: { minimum: 2, maximum: 200 }, presence: true

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
