include ActionView::Helpers::DateHelper

class CourseSession < ApplicationRecord
  belongs_to :course
  belongs_to :room

  validates :course, presence: true
  validates :room, presence: true
  # NOTE: duration stored in seconds
  # TODO: make it so that hours are inputted instead of seconds or another format
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 10800, message: "must be between 1000 seconds and 3 hours (10800)" }
  validates :day_of_week, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 7, message: "must be a number from 0-6, where 0 represents Sunday and 6 represents Saturday" }

  def duration_time
    duration.seconds
  end

  def duration_readable
    distance_of_time_in_words(0, duration.seconds)
  end
end
