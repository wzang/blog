class User < ActiveRecord::Base
  attr_accessible :name, :password
  
  validates :name, :presence => true,  :uniqueness => true
  
  validates :password, :presence =>true
  
  def has_password?(input_password)
    password == input_password
  end
  
  def self.authenticate(name, input_password)
    user = find_by_name(name)
    (user && user.has_password?(input_password)) ? user : nil
  end
  
  before_save :create_remember_token   
  has_many :posts
  has_many :comments
  

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end   
  
end
