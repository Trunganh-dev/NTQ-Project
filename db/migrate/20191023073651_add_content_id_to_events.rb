class AddContentIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :content_id, :integer
  end
end
