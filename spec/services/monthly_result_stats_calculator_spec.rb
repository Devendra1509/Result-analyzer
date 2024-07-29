require 'rails_helper'
RSpec.describe MonthlyResultStatsCalculator, type: :service do
  describe '.monthly_result' do
    let(:today) { Date.today }
    before do
      create(:daily_result_stat, subject: 'Science', date: today - 1.day, daily_low: 85.25, daily_high: 90.75, result_count: 50)
      create(:daily_result_stat, subject: 'Science', date: today - 2.days, daily_low: 80.00, daily_high: 85.00, result_count: 60)
      create(:daily_result_stat, subject: 'Science', date: today - 3.days, daily_low: 75.00, daily_high: 80.00, result_count: 50)
      create(:daily_result_stat, subject: 'Science', date: today - 4.days, daily_low: 70.00, daily_high: 75.00, result_count: 20)
      create(:daily_result_stat, subject: 'Science', date: today - 5.days, daily_low: 65.00, daily_high: 70.00, result_count: 20)
      MonthlyResultStatsCalculator.monthly_result
    end
    it 'creates monthly average for each subject' do
      expect(MonthlyAverage.count).to eq(1)
    end
    it 'calculates the correct monthly averages for Science' do
      science_avg = MonthlyAverage.find_by(subject: 'Science')
      expected_avg_low = (85.25 + 80.00 + 75.00 + 70.00 + 65.00) / 5.0
      expected_avg_high = (90.75 + 85.00 + 80.00 + 75.00 + 70.00) / 5.0
      total_count = 200
      expect(science_avg.monthly_avg_low).to be_within(0.01).of(expected_avg_low)
      expect(science_avg.monthly_avg_high).to be_within(0.01).of(expected_avg_high)
      expect(science_avg.monthly_result_count).to eq(total_count)
    end
  end
end




