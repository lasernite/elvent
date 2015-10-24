class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.datetime :start_time
      t.integer :fb_id, :limit => 8
      t.integer :attending_count

      t.timestamps
    end
  end
end
