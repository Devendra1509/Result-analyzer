require 'rails_helper'
RSpec.describe DailyResultStatsCalculator, type: :calculator do
   describe '.daily_result' do
    let(:today) { Date.today }
    before do
      create(:result_data, subject: 'Science', timestamp: today.beginning_of_day + 2.hours, marks: 85.25)
      create(:result_data, subject: 'Science', timestamp: today.beginning_of_day + 4.hours, marks: 90.75)
      create(:result_data, subject: 'Science', timestamp: today.beginning_of_day + 6.hours, marks: 78.5)
      create(:result_data, subject: 'Science', timestamp: today.beginning_of_day + 8.hours, marks: 88.0)
      DailyResultStatsCalculator.daily_result
    end
  end
end