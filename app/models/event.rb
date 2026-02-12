class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :end_time, comparison: { greater_than_or_equal_to: :start_time }

  scope :by_start_time, -> { order(start_time: :asc) }
  scope :by_end_time, -> { order(end_time: :asc) }
  scope :current, -> { where(published: true, end_time: (Time.current..)) }
  scope :today, -> { where(published: true, start_time: (Time.current.beginning_of_day..)) }
  scope :prior_published, -> { where(published: true, end_time: ...Time.yesterday.end_of_day) }

  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }
end
