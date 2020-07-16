class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :zipcode, :string
    add_column :users, :oauth_token, :string 
    add_column :users, :oauth_expires_at, :datetime 
  end
end
