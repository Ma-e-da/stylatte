class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :string
    add_column :users, :size, :string
    add_column :users, :age, :string
    add_column :users, :hair_style, :string
    add_column :users, :hair_color, :string
    add_column :users, :eyes_color, :string
    add_column :users, :favs, :text
  end
end
