class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :body_size, :varchar
    add_column :users, :hair_color, :varchar
    add_column :users, :hair_style, :varchar
    add_column :users, :eyes_color, :varchar
    add_column :users, :age, :varchar
    add_column :users, :favorite_brands, :text
    add_column :users, :favorite_people, :text
    add_column :users, :favorite_anything, :text
  end
end
