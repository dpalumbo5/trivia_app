class Game < ActiveRecord::Base
  belongs_to :user
  has_many :rounds
  #if it has to have one -> belongs_to
  validates :user_id, presence: true
end
