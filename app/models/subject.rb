class Subject < ApplicationRecord
  has_many :teachers
  has_many :teacher_certifications

  validates :name, presence: true, length: { minimum: 2, maximum: 200 }
  validates :code, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
end
