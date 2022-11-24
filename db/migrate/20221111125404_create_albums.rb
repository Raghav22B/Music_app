class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.boolean :download

      t.timestamps
    end
  end
end
