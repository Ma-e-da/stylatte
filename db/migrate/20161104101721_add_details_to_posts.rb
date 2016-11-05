class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :product, :string
    add_column :posts, :for_who, :string
    add_column :posts, :size, :string
    add_column :posts, :color, :string
    add_column :posts, :style_genre, :string
    add_column :posts, :scene, :string
    add_column :posts, :season, :string
    add_column :posts, :price_range, :string
    add_column :posts, :deadline, :datetime
  end
end
