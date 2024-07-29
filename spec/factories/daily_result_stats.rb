FactoryBot.define do
  factory :daily_result_stat do
    date { Date.today }
    subject { 'Science' }
    daily_low { 85.25 }
    daily_high { 90.75 }
    result_count {rand (10..100)}
  end
end