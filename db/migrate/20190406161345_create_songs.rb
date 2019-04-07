class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :name
      t.integer :artist_id
    end
  end
end
