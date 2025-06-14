class TeacherCertification < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher


  validates :subject, presence: true
  validates :teacher, presence: true
  validates :certifier, presence: true, length: { minimum: 2, maximum: 300 }
  validates :date_obtained, presence: true
  validate :date_obtained_cannot_be_in_the_future
  
  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end

  private

  def date_obtained_cannot_be_in_the_future
    if date_obtained.present? && date_obtained > Date.today
      errors.add(:date_obtained, "can't be in the future")
    end
  end
end
