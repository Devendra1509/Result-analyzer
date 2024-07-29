require 'rails_helper'
RSpec.describe DailyResultStatsCalculator, type: :service do
  describe '.daily_result' do
    let(:yesterday) { Date.yesterday }
    before do
      create(:result_data, subject: 'Science', timestamp: yesterday.beginning_of_day + 2.hours, marks: 85.25)
      create(:result_data, subject: 'Science', timestamp: yesterday.beginning_of_day + 4.hours, marks: 90.75)
      create(:result_data, subject: 'Math', timestamp: yesterday.beginning_of_day + 6.hours, marks: 78.5)
      create(:result_data, subject: 'Math', timestamp: yesterday.beginning_of_day + 8.hours, marks: 88.0)
      DailyResultStatsCalculator.daily_result
    end

    it 'creates daily result stats for each subject' do
      expect(DailyResultStat.count).to eq(2)
    end

    it 'calculates the correct daily low and high marks for Science' do
      science_stat = DailyResultStat.find_by(subject: 'Science')
      expect(science_stat.daily_low).to eq(85.25)
      expect(science_stat.daily_high).to eq(90.75)
      expect(science_stat.result_count).to eq(2)
    end

    it 'calculates the correct daily low and high marks for Math' do
      math_stat = DailyResultStat.find_by(subject: 'Math')
      expect(math_stat.daily_low).to eq(78.5)
      expect(math_stat.daily_high).to eq(88.0)
      expect(math_stat.result_count).to eq(2)
    end
  


  end
end

































