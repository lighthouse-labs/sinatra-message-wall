class AddMessageCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :message_count, :integer, { default: 0 }
  end
end
