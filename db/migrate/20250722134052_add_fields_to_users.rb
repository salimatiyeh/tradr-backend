class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_image_url, :string
    add_column :users, :bio, :text
  end
end
