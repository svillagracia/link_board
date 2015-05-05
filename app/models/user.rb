class User < ActiveRecord::Base

  has_secure_password
  has_many :comments
  # Posts created by the user
  has_many :posts
  # Votes about this user (via votable)
  has_many :votes, as: :votable
  # Votes cast by the user (via user_id foreign key)
  has_many :ratings, class_name: 'Vote'

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates_presence_of :password, on: :create

  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save
  end

end
