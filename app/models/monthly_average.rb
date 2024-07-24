class MonthlyAverage < ApplicationRecord
  validates :date, :subject, :monthly_avg_low, :monthly_avg_high, :monthly_result_count_used, presence: true
end