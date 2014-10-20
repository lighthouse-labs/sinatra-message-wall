class AddUpvoteCounterToMsgs < ActiveRecord::Migration
  def change
    add_column :messages, :upvotes, :integer
  end
end
