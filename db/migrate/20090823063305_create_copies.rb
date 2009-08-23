class CreateCopies < ActiveRecord::Migration
  def self.up
    create_table :copies do |t|
      t.integer :doclate_id
      t.integer :copy_id
    end
    add_index :copies, [:doclate_id, :copy_id], :unique => true
  end

  def self.down
    drop_table :copies
  end
end
