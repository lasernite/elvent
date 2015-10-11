class AddFbTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :fb_token, :string
  	add_column :users, :preferred_email, :string
  end
end
