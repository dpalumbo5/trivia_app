class Round < ActiveRecord::Base
  belongs_to :topic
  #extending to active record base checks postgres tables for attributes
  validates :topic_id, presence: true
  validates :game_id, presence: true
end

