class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :course_sessions
  has_many :course_prerequisites

  validates :teacher, presence: true
  validates :subject, presence: true
  validates :code, length: { minimum: 2, maximum: 20 }
  # TODO: make school_year follow a format?
  validates :school_year, length: { minimum: 4, maximum: 15 }, presence: true
  validates :description, length: { minimum: 10, maximum: 400 }, presence: true
  validates :name, length: { minimum: 2, maximum: 200 }, presence: true
end
