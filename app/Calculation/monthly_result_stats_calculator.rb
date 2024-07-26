class MonthlyResultStatsCalculator

def self.monthly_result
    subjects = DailyResultStat.pluck(:subject).uniq
    today = Date.today
    subjects.each do |subject|
      results = DailyResultStat.where(subject: subject).order(date: :desc)
     days_data = []
      total_count = 0
       results.each do |result|
       days_data << result
        total_count = total_count + result.result_count
        break if total_count >= 200 && days_data.size >= 5
      end
      
      monthly_avg_low = days_data.map(&:daily_low).sum / days_data.size
      monthly_avg_high = days_data.map(&:daily_high).sum / days_data.size
      MonthlyAverage.create(
        date: today,
        subject: subject,
        monthly_avg_low: monthly_avg_low,
        monthly_avg_high: monthly_avg_high,
        monthly_result_count: total_count
      )
    end
  end
end

