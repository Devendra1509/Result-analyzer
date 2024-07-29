FactoryBot.define do
  factory :result_data do
    subject { 'Science' }
    timestamp { Time.zone.now }
    marks { 85.25 }
  end
end