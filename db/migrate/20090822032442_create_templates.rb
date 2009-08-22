class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.belongs_to  :user
      t.integer     :parent_id
      t.string      :title
      t.text        :body_markdown
      t.text        :body_html
      t.boolean     :private, :default => false
      t.timestamps
    end
    add_index :templates, :user_id
    add_index :templates, :parent_id
    add_index :templates, :private
  end

  def self.down
    drop_table :templates
  end
end
