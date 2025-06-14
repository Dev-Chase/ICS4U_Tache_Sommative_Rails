class Building < ApplicationRecord
  has_many :rooms

  validates :name, presence: true, length: { minimum: 1, maximum: 150 }

  def self.ransackable_attributes(auth_object = nil)
    column_names
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
