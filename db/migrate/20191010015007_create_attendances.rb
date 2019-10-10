class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.date    :date
      t.text    :note
      t.boolean :isDone
      t.boolean :present

      t.timestamps
    end
  end
end
