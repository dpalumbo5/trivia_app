class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :round
  has_many :scores
  #extending to active record base checks postgres tables for attributes
  validates :users_answer, presence: true
  validates :question_id, presence: true
  validates :is_correct, inclusion: { in: [ true, false ] }
  validates :round_id, presence: true
end
