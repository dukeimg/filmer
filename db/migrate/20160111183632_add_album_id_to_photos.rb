class AddAlbumIdToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.integer :album_id
    end
  end
end
