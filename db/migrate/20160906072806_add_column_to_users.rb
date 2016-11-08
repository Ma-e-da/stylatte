class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stylist, :boolean, default: false
    add_column :users, :public, :boolean, default: true
    add_column :users, :picture, :string
    add_column :users, :website, :string
    add_column :users, :bio, :text
    add_column :users, :favs, :text
  end
end
