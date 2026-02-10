class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time }
  
  scope :current, -> { where(published: true, end_time: (Time.current..)).order(start_time: :asc) }
  scope :recent, -> { where(published: true, start_time: (Time.current.beginning_of_day..)) }
  scope :prior_published, -> { where(published: true, end_time: ...Time.current.end_of_day) }
  
  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }
end
