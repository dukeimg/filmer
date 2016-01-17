class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps null: false
    end
  end
end
