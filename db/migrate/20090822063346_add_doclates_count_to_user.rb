class AddDoclatesCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :doclates_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :doclates_count
  end
end
