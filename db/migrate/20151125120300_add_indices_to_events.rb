class AddIndicesToEvents < ActiveRecord::Migration
  def change
  	add_index :events, :fb_id
  	add_index :events, :longitude
  	add_index :events, :latitude
  end
end
