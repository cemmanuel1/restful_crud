class User < ActiveRecord::Base
  validates :name, presence: {message: "Must enter a your name"}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Not a valid email address" }
  
  has_many :posts

  before_save :encrypt_password

  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end

  def self.authenticate(email, password)
    User.where(email: email, password: Digest::SHA1.hexdigest(password)).first
  end


end
