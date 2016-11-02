class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :integer
    add_column :users, :size, :integer
    add_column :users, :age, :integer
    add_column :users, :hair_style, :integer
    add_column :users, :hair_color, :integer
    add_column :users, :eyes_color, :integer
    add_column :users, :favorites, :text
  end
end
