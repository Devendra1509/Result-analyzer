class ResultData < ApplicationRecord
  validates :subject, :timestamp, :marks, presence: true
end