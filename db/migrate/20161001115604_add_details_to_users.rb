class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :country, :integer
    add_column :users, :height, :string
    add_column :users, :size, :string
    add_column :users, :age, :string
    add_column :users, :hair_style, :integer
    add_column :users, :hair_color, :integer
    add_column :users, :eyes_color, :integer
  end
end
