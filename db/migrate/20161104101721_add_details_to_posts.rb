class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :item, :integer
    add_column :posts, :for_who, :integer
    add_column :posts, :size, :integer
    add_column :posts, :color, :integer
    add_column :posts, :style_genre, :integer
    add_column :posts, :scene, :integer
    add_column :posts, :season, :integer
    add_column :posts, :price_range, :integer
    add_column :posts, :deadline, :datetime
  end
end
