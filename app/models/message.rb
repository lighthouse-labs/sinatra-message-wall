class Message < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

end
