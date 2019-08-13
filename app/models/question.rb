class Question < ActiveRecord::Base
  belongs_to :topic
  has_many :responses
  #extending to active record base checks postgres tables for attributes
  validates :answers, presence: true
  validates :topic_id, presence: true
end
