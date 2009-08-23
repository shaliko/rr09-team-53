class AddDocumentsCountToDoclate < ActiveRecord::Migration
  def self.up
    add_column :doclates, :documents_count, :integer, :default => 0
  end

  def self.down
    remove_column :doclates, :documents_count
  end
end
