class Teacher < ApplicationRecord
  belongs_to :main_subject, class_name: "Subject"
  has_many :courses
  has_many :teacher_certifications

  validates :age, numericality: { only_integer: true, greater_than: 18 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  
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
