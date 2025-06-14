class Room < ApplicationRecord
  belongs_to :building
  has_many :course_sessions

  validates :building, presence: true
  validates :code, presence:true, length: { minimum:1, maximum: 100 }
  validates :directions, length: { maximum: 200 }
  # TODO: verify validation below
  validates :floor_level, numericality: { only_integer:true }

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
