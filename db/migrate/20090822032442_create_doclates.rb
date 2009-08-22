class CreateDoclates < ActiveRecord::Migration
  def self.up
    create_table :doclates do |t|
      t.belongs_to  :user
      t.integer     :parent_id
      t.string      :title
      t.text        :body_markdown
      t.text        :body_html
      t.boolean     :private, :default => false
      t.timestamps
    end
    add_index :doclates, :user_id
    add_index :doclates, :parent_id
    add_index :doclates, :private
  end

  def self.down
    drop_table :doclates
  end

end
