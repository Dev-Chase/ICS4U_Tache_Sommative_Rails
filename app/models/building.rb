class Building < ApplicationRecord
  has_many :rooms

  validates :name, presence: true, length: { minimum: 1, maximum: 150 }
end
