class Message < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

  after_create :increment_user_message_count
  after_destroy :decrement_user_message_count

  private

  def increment_user_message_count
    self.user.message_count += 1
    self.user.save
  end

  def decrement_user_message_count
    self.user.message_count -= 1
    self.user.save
  end

end
