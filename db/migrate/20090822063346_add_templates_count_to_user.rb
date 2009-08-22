class AddTemplatesCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :templates_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :templates_count
  end
end
