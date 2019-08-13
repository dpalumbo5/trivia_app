class Score < ActiveRecord::Base
  belongs_to :response
  validates :response_id, presence: true
end
