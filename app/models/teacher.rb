class Teacher < ApplicationRecord
  belongs_to :main_subject # TODO: verify if good or needs to be changed to subjects or has_one
  has_many :courses
  has_many :teacher_certifications

  validates :age, numericality: { only_integer: true, greater_than: 18 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
