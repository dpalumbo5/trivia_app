class User < ActiveRecord::Base
  has_many :games
  has_one  :auth_token
  #has many has one and belongs to define relationships to other tables. Password is an attribute for the user
  #allows you to call user.games
  #active record layer lets you infer postgres relationships in code
  #postgres layer enforces relationships between database tables
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8}

  validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
  #active record performs validation before postgres table, has better error handling and more options for error handling
  #also allows you to try user.new and then user.valid? which allows you to determine if it's valid w/o raising errors
end
