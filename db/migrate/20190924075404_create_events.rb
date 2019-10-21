class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string     :title
      t.string     :thumbnail
      t.string     :content
      t.string     :document
      t.date       :startDate
      t.date       :endDate
      t.string     :duration
      t.string     :color
      t.string     :speaker
      t.string     :something
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
