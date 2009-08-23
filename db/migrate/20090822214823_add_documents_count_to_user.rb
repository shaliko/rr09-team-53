class AddDocumentsCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :documents_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :documents_count
  end
end
