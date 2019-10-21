class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.references :content, foreign_key: true
      t.string  :note
      t.timestamps
    end
    add_index :groups, [:user_id, :created_at]
    add_index :groups, [:event_id, :created_at]
    add_index :groups, [:content_id, :created_at]
  end
end
