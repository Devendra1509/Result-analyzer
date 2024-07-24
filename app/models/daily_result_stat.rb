class DailyResultStat < ApplicationRecord
  validates :date, :subject, :daily_low, :daily_high, :result_count, presence: true
end



