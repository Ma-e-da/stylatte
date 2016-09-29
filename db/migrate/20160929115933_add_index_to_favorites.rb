class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:user_id, :scomment_id], unique: true
  end
end
