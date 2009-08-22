class CreateFeeds < ActiveRecord::Migration

  def self.up
    create_table :feeds do |t|
      t.belongs_to  :user
      t.string      :subject_type
      t.integer     :subject_id
      t.string      :event_type

      t.timestamps
    end

    add_index(:feeds, :user_id)
    add_index(:feeds, [:subject_id, :subject_type])
    add_index(:feeds, :event_type)
    add_index(:feeds, :created_at)
  end

  def self.down
    drop_table :feeds
  end

end
