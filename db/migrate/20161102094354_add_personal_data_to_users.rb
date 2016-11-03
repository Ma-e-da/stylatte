class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :text
    add_column :users, :size, :text
    add_column :users, :age, :text
    add_column :users, :hair_style, :text
    add_column :users, :hair_color, :text
    add_column :users, :eyes_color, :text
    add_column :users, :favs, :text
  end
end
