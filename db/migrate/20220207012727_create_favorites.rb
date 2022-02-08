class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :shop_id, null: false
      t.string :name, null: false
      t.string :genre, null: false
      t.string :open, null: false
      t.string :photo, null: false
      t.timestamps
    end

    add_index :favorites, :shop_id, unique: true
  end
end
