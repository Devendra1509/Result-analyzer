require 'rails_helper'

RSpec.describe ResultData, type: :model do

   it 'is valid with a subject, marks and timestamp' do
    result=ResultData.new(
      subject: "English",
      marks: 78,
      timestamp:'2022-04-16 05:31:44.678'
      )
     expect(result).to be_valid
   end

   it 'is invalid without a subject' do
      result = ResultData.new(subject: nil)
      result.valid?
      expect(result.errors[:subject]).to include("can't be blank")
   end

    it 'is invalid without a marks' do
      result = ResultData.new(marks: nil)
      result.valid?
      expect(result.errors[:marks]).to include("can't be blank")
   end

   it 'is invalid without a subject' do
      result = ResultData.new(timestamp: nil)
      result.valid?
      expect(result.errors[:timestamp]).to include("can't be blank")
   end

end
