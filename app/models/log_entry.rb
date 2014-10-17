class LogEntry < ActiveRecord::Base
  belongs_to :wine

  RATINGS = 1..5
  validates :name, :rating, :location, :comments, :tasted_on, presence: true
  validates :stars, inclusion: { in: RATINGS, message: "must be from #{RATINGS.first} to #{RATINGS.last}" }

end

