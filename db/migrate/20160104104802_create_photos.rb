class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.boolean :private
      t.attachment :file

      t.timestamps null: false
    end
  end
end
