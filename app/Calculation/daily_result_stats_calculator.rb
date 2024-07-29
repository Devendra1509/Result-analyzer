class DailyResultStatsCalculator
  def self.daily_result
    results = ResultData.where('created_at >= ? AND created_at < ?', Date.yesterday.end_of_day, Date.today.end_of_day)
    subjects = results.pluck(:subject).uniq
    subjects.each do |subject|
      subject_results = results.where(subject: subject)
      daily_low = subject_results.minimum(:marks)
      daily_high = subject_results.maximum(:marks)
      result_count = subject_results.count

      DailyResultStat.create!(
        date: Date.yesterday,
        subject: subject,
        daily_low: daily_low,
        daily_high: daily_high,
        result_count: result_count
      )
    end
   MonthlyAverage.monthly_result if third_wednesday_week?
  end
  
  private
  def third_wednesday_week?
    today = Date.today
    today.monday? && (today.day + 2) / 7 == "wednesday"
  end
end