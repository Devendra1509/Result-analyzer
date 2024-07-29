FactoryBot.define do
  factory :monthly_average do
    date { Date.today }
    subject { 'Science' }
    monthly_avg_low { 85.25 }
    monthly_avg_high { 90.75 }
    monthly_result_count { 100 }
  end
end