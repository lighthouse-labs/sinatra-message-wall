class User < ActiveRecord::Base

  has_many :messages

  validates :email, presence: true
  validates :password, presence: true

end
