class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.belongs_to  :doclate
      t.belongs_to  :user
      t.string      :title
      t.text        :body_markdown
      t.text        :body_html
      t.timestamps
    end
    add_index :documents, :user_id
    add_index :documents, :doclate_id
  end

  def self.down
    drop_table :documents
  end
end
