require 'rails_helper'

RSpec.describe DailyResultStat, type: :model do
 
    it 'is valid with a subject, date , daily_high , daily_low , result_count' do
    result=DailyResultStat.new(
      subject: "English",
      date: "22/07/2024",
      daily_high: 78,
      daily_low: 62,
      result_count:5
      )
     expect(result).to be_valid
   end

    it 'is invalid without a subject' do
      result = DailyResultStat.new(subject: nil)
      result.valid?
      expect(result.errors[:subject]).to include("can't be blank")
   end

    it 'is invalid without a date' do
      result = DailyResultStat.new(date: nil)
      result.valid?
      expect(result.errors[:date]).to include("can't be blank")
    end

    it 'is invalid without a daily_high' do
      result = DailyResultStat.new(daily_high: nil)
      result.valid?
      expect(result.errors[:daily_high]).to include("can't be blank")
    end


    it 'is invalid without a daily_low' do
      result = DailyResultStat.new(daily_low: nil)
      result.valid?
      expect(result.errors[:daily_low]).to include("can't be blank")
    end

    it 'is invalid without a result_count' do
      result = DailyResultStat.new(result_count: nil)
      result.valid?
      expect(result.errors[:result_count]).to include("can't be blank")
    end


end



