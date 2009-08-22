class AddFriendshipsCountInUser < ActiveRecord::Migration

  def self.up
    add_column :users, :friendships_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :friendships_count
  end

end
