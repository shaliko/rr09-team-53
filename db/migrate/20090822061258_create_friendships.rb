class CreateFriendships < ActiveRecord::Migration

  def self.up
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps
    end
    add_index(:users, [:user_id, :friend_id])
  end

  def self.down
    drop_table :friendships
  end

end
