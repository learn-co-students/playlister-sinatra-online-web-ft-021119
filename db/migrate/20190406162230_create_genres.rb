class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.text :name
      t.text :artist
      t.text :song
      t.integer :artist_id
    end
  end
end
