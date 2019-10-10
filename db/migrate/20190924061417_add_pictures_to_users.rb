class AddPicturesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pictures, :string
    add_column :users, :givenname, :string
    add_column :users, :fullname, :string
    add_column :users, :dateofbirth, :datetime
  end
end
